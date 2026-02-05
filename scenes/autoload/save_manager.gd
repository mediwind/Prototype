extends Node

const SAVE_FILE_PATH = "user://game_data.tres"

var game_data: GameData
var is_loading_state: bool = false

func _ready():
	load_game_data()


func has_save_file() -> bool:
	return ResourceLoader.exists(SAVE_FILE_PATH)


func save_game():
	print("[SaveManager] Saving game...")
	save_game_data()


func load_game():
	load_game_data()


func delete_save_file():
	if has_save_file():
		DirAccess.remove_absolute(SAVE_FILE_PATH)


func reset_game_data():
	# Delete save file if exists to ensure persistence is cleared
	delete_save_file()
	# Re-initialize in-memory data
	initialize_default_values()
	
	if TimeManager:
		TimeManager.reset_time()

	
	# 3. Propagate Reset to ALL Managers (Refresh References)
	_propagate_data_to_managers()


func save_game_data():
	# Pre-Save: Force sync of IDs for Inventory
	if game_data.inventory_data:
		game_data.inventory_data.prepare_serialization()

	# Collect data from Managers (Loose Coupling)
	if FarmManager:
		game_data.farm_save_data = FarmManager.get_save_data()
	if BuildManager:
		game_data.placed_objects_data = BuildManager.get_save_data()
	if TimeManager:
		game_data.time_save_data = TimeManager.get_save_data()
	if NPCManager:
		game_data.npc_save_data = NPCManager.get_save_data()

	# Capture Scene & Position
	var current_scene = get_tree().current_scene
	if current_scene:
		game_data.current_scene_path = current_scene.scene_file_path
		
	var player = get_tree().get_first_node_in_group("player")
	if player:
		game_data.player_position = player.global_position
		
	ResourceSaver.save(game_data, SAVE_FILE_PATH)


func load_game_data():
	if ResourceLoader.exists(SAVE_FILE_PATH):
		# Force reload from disk, bypassing cache to avoid lingering dirty state
		var loaded_data = ResourceLoader.load(SAVE_FILE_PATH, "", ResourceLoader.CACHE_MODE_REPLACE) as GameData
		if loaded_data:
			game_data = loaded_data
			
			# Post-Load: Restore ID-based references
			if game_data.inventory_data:
				game_data.inventory_data.restore_item_references()
			
			# Inject data into Managers
			_propagate_data_to_managers()
		else:
			print("Failed to load game data resource.")
			initialize_default_values()
			_propagate_data_to_managers()
	else:
		print("No save file found, initializing default values.")
		initialize_default_values()
		_propagate_data_to_managers()

func _propagate_data_to_managers():
	# Critical: Update all managers that hold references to GameData sub-resources
	if InventoryManager:
		InventoryManager.load_save_data()
	
	if SkillManager:
		SkillManager.load_save_data()
		
	if StatManager:
		StatManager.load_save_data()
	
	if LevelAndExpManager:
		LevelAndExpManager.load_save_data()
		
	if CurrencyManager:
		CurrencyManager.load_save_data()


	# Managers with specific load signatures
	if FarmManager:
		FarmManager.load_save_data(game_data.farm_save_data)
		
	if BuildManager:
		BuildManager.load_save_data(game_data.placed_objects_data)

	if TimeManager:
		TimeManager.load_save_data(game_data.time_save_data)
		
	if NPCManager:
		NPCManager.load_save_data(game_data.npc_save_data)


func initialize_default_values():
	game_data = GameData.new()
	game_data.currency_data = CurrencyData.new()
	game_data.skill_data = SkillData.new()
	game_data.level_and_exp_data = LevelAndExpData.new()
	game_data.inventory_data = InventoryData.new()
	game_data.stat_data = StatData.new()