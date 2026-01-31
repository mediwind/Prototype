extends Node

@onready var game_ui = $TownUI
@onready var skill_ui_button = $TownUI/HBoxContainer/SkillUIButton
@onready var inventory_ui_button = $TownUI/HBoxContainer/InventoryUIButton
@onready var floor_tile_map = $TileMapLayer

@export var tabbed_skill_tree_scene: PackedScene
@export var inventory_scene: PackedScene
@export var chest_ui_scene: PackedScene

func _ready():
	# Indoors: Stop calendar time (0.0) so days don't pass while inside
	if TimeManager:
		TimeManager.set_calendar_time_multiplier(0.0)
		
	# Connect UI Signals
	skill_ui_button.pressed.connect(on_skill_ui_button_pressed)
	inventory_ui_button.pressed.connect(on_inventory_ui_button_pressed)
	
	# Initialize Inventory Connection for Hotbar
	InventoryManager.hand_equipped.connect(_on_hand_equipped)
	_on_hand_equipped(InventoryManager.equipped_hand_item)
	
	# Restore Placed Objects
	if floor_tile_map:
		BuildManager.restore_placed_objects(floor_tile_map, $Entities)
	else:
		print("PlayerHome: 'TileMapLayer' node missing. Building disabled.")

func on_skill_ui_button_pressed():
	var tabbed_skill_tree = tabbed_skill_tree_scene.instantiate()
	game_ui.add_child(tabbed_skill_tree)
	get_tree().paused = true

func on_inventory_ui_button_pressed():
	var inventory = inventory_scene.instantiate()
	game_ui.add_child(inventory)
	get_tree().paused = true

func _on_hand_equipped(item: ItemData):
	if item and (item is PlaceableData or "placeable_scene" in item):
		print("PlayerHome: Starting Placement for ", item.name)
		if floor_tile_map:
			BuildManager.start_placing(item, floor_tile_map, $Entities)
	else:
		BuildManager.cancel_build()

func _unhandled_input(event):
	if BuildManager.is_building:
		return

	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = floor_tile_map.get_global_mouse_position()
		
		# RIGHT CLICK: INTERACTION (Chest)
		if event.button_index == MOUSE_BUTTON_RIGHT:
			var space_state = floor_tile_map.get_world_2d().direct_space_state
			var query = PhysicsPointQueryParameters2D.new()
			
			var local_pos = floor_tile_map.local_to_map(mouse_pos)
			query.position = floor_tile_map.map_to_local(local_pos)
			query.collide_with_areas = true
			query.collide_with_bodies = true
			
			var results = space_state.intersect_point(query)
			
			for result in results:
				var collider = result["collider"]
				
				# Try interact (Collider itself likely doesn't have it, checking parent)
				var interact_result = null
				if collider.has_method("interact"):
					interact_result = collider.interact(player_node)
				elif collider.get_parent().has_method("interact"):
					interact_result = collider.get_parent().interact(player_node)
					
				# Handle Result - Open Inventory UI if valid
				if interact_result is InventoryData:
					_open_container_ui(interact_result)
					return
				
				# If we interacted but it wasn't a container (e.g. Dialogue), return
				if interact_result != null:
					return

func _open_container_ui(data: InventoryData):
	var chest_ui = chest_ui_scene.instantiate()
	game_ui.add_child(chest_ui)
	chest_ui.open(data)
	get_tree().paused = true

@onready var player_node = $Entities/PlayerHuman
