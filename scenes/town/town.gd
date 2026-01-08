extends Node

@onready var skill_ui_button = $TownUI/HBoxContainer/SkillUIButton
@onready var inventory_ui_button = $TownUI/HBoxContainer/InventoryUIButton
@onready var soil_tile_map = $SoilTileMap
@onready var crop_tile_map = $CropTileMap
@onready var town_ui = $TownUI

@export var tabbed_skill_tree_scene: PackedScene
@export var inventory_scene: PackedScene


func _ready():
	SaveManager.save_game_data()
	skill_ui_button.pressed.connect(on_skill_ui_button_pressed)
	inventory_ui_button.pressed.connect(on_inventory_ui_button_pressed)
	
	# Connect Farming Signals
	FarmManager.crop_updated.connect(_on_crop_updated)
	FarmManager.daily_growth_tick.connect(_on_daily_growth_tick)


func on_skill_ui_button_pressed():
	var tabbed_skill_tree = tabbed_skill_tree_scene.instantiate()
	town_ui.add_child(tabbed_skill_tree)
	get_tree().paused = true


func on_inventory_ui_button_pressed():
	var inventory = inventory_scene.instantiate()
	town_ui.add_child(inventory)
	get_tree().paused = true

@onready var player = $PlayerHuman
const INTERACTION_DISTANCE = 3.0 # Grid distance (Chebyshev)
const TILLED_SOIL_ATLAS_COORDS = Vector2i(6, 22) # Placeholder: User to confirm location
const SOIL_SOURCE_ID = 0
const CROP_SOURCE_ID = 1

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var hand_item = InventoryManager.equipped_hand_item
		if not hand_item:
			return
			
		var mouse_pos = soil_tile_map.get_global_mouse_position()
		
		# Grid-Based Distance Check (3x3 area)
		var player_pos = player.global_position
		var player_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(player_pos))
		var target_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(mouse_pos))
		
		var diff = (target_coords - player_coords).abs()
		if diff.x > 1 or diff.y > 1:
			return # Too far

		# Interaction Logic
		if hand_item.name == "Hoe":
			print("Farming: Tilling soil at ", target_coords)
			# Set the soil layer to Tilled Soil
			soil_tile_map.set_cell(target_coords, SOIL_SOURCE_ID, TILLED_SOIL_ATLAS_COORDS)
			
		elif hand_item.name == "Watering Can":
			# TODO: Check if there is a crop or tilled soil? For now, just water the crop data
			if FarmManager.farm_data.has(target_coords):
				print("Farming: Watering at ", target_coords)
				FarmManager.water_crop(target_coords)
			
		elif hand_item.name.ends_with("Seed") or hand_item.name == "Corn Seed":
			# VALIDATION 1: Is there a crop already?
			if FarmManager.farm_data.has(target_coords):
				print("Farming: Crop already exists here.")
				return
				
			# VALIDATION 2: Is the soil tilled?
			var tile_atlas_coords = soil_tile_map.get_cell_atlas_coords(target_coords)
			if tile_atlas_coords != TILLED_SOIL_ATLAS_COORDS:
				print("Farming: Soil is not tilled.")
				# Optional: Feedback UI
				return

			print("Farming: Planting ", hand_item.name, " at ", target_coords)
			FarmManager.add_crop(target_coords, hand_item)
			# CONSUMPTION: Remove 1 seed
			InventoryManager.consume_equipped_item(1)


func _on_crop_updated(coords: Vector2i, data: Dictionary):
	_update_tile_visual(coords, data)

func _on_daily_growth_tick(updates: Dictionary):
	# Staggered Growth Effect (The "Pop")
	# Random order for organic feel
	var coords_list = updates.keys()
	coords_list.shuffle()
	
	for coords in coords_list:
		var data = updates[coords]
		# Random delay between 0.0 and 1.5 seconds distributed across updates
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		_update_tile_visual(coords, data)

func _update_tile_visual(coords: Vector2i, data: Dictionary):
	# source_id 1 is Crops (CROP_SOURCE_ID constant is used implicitly here or we can use the literal 1 to be safe until constant scope is fixed if needed, but we defined CROP_SOURCE_ID in script scope)
	# atlas_coords are now calculated by FarmManager to support randomization and growth
	var atlas_coords = data.get("atlas_coords", Vector2i(0, 0))
	crop_tile_map.set_cell(coords, CROP_SOURCE_ID, atlas_coords)
