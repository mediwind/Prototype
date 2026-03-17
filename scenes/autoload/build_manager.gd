extends Node

var current_placeable_data: Resource = null # Type: PlaceableData (Weakened)
var preview_instance: Node2D = null
var is_building: bool = false
var tilemap: TileMapLayer = null # Reference to Ground/Collision layer for validation
var parent_node: Node2D = null # Where to spawn (Entities)

# State Flags
var is_transient_build: bool = false
# callbacks: { "on_success": Callable(coords), "on_cancel": Callable() }
var build_callbacks: Dictionary = {}

# Persistence Data
# Key: Scene Path (String), Value: Dictionary { Vector2i(Coords): { "id": item_id, "custom_data": {} } }
var placed_objects: Dictionary = {}

func _process(_delta):
	if not is_building or not preview_instance:
		return
		
	# Validation: Check if tilemap is still valid (Scene change safety)
	if not is_instance_valid(tilemap) or not tilemap.is_inside_tree():
		cancel_build()
		return
		
	# Follow Mouse
	var mouse_pos = tilemap.get_global_mouse_position()
	var tile_pos = tilemap.local_to_map(mouse_pos)
	var world_pos = tilemap.map_to_local(tile_pos)
	
	preview_instance.global_position = world_pos
	
	# Validation Color
	var valid = check_build_possible(tile_pos)
	var color = Color(0, 1, 0, 0.5) if valid else Color(1, 0, 0, 0.5)
	preview_instance.modulate = color

func _unhandled_input(event):
	if not is_building: return
	
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var mouse_pos = tilemap.get_global_mouse_position()
			var tile_pos = tilemap.local_to_map(mouse_pos)
			
			if check_build_possible(tile_pos):
				place_object(tile_pos)
				
				# Call Success Callback (Client handles cost)
				if build_callbacks.has("on_success"):
					build_callbacks["on_success"].call(tile_pos)
					
				# Check if we should continue building?
				# For now, let's assume we might continue if we have items, 
				# BUT the client needs to re-trigger or we need a way to check 'can_afford'.
				# Basic implementation: One logic per click.
				
				# If we want continuous building, client needs to handle it.
				# For now, let's NOT close automatically? Or rely on Client to cancel?
				# Valid Strategy: Keep building state until Cancel or Explicit Stop.
				pass
				
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			cancel_build()

func start_placing(data: Resource, _tilemap: TileMapLayer, _parent: Node2D, _is_transient: bool = false, callbacks: Dictionary = {}):
	if is_building:
		cancel_build()
		
	current_placeable_data = data
	tilemap = _tilemap
	parent_node = _parent
	is_transient_build = _is_transient
	build_callbacks = callbacks
	is_building = true
	
	# Create Preview
	if data.placeable_scene:
		preview_instance = data.placeable_scene.instantiate()
		parent_node.add_child(preview_instance)
		_disable_collision_recursive(preview_instance)

func place_object(coords: Vector2i):
	if not current_placeable_data or not parent_node: return
	
	var instance = current_placeable_data.placeable_scene.instantiate()
	instance.global_position = tilemap.map_to_local(coords)
	
	parent_node.add_child(instance)
	
	# Handle Persistence Only if NOT transient
	if not is_transient_build:
		# Default Data
		var object_data = {
			"id": current_placeable_data.id,
			"custom_data": {}
		}
		
		# Initialize instance ID
		if instance.has_method("get_save_data"):
			instance.placeable_data = current_placeable_data
			instance.set_meta("grid_coords", coords)
			
		_store_object_data(coords, object_data)
	
	# Emit signal if needed
	# signal object_placed(coords, instance)

func update_object_custom_data(coords: Vector2i, data: Dictionary):
	var current_scene = get_tree().current_scene
	if not current_scene: return
	
	var scene_path = current_scene.scene_file_path
	if placed_objects.has(scene_path) and placed_objects[scene_path].has(coords):
		placed_objects[scene_path][coords]["custom_data"] = data

func check_build_possible(coords: Vector2i) -> bool:
	if not current_placeable_data: return false
	
	# 1. Check if already occupied by BuildManager logic (Placed Objects)
	var current_scene = get_tree().current_scene
	if not current_scene: return false
	
	var scene_path = current_scene.scene_file_path
	if placed_objects.has(scene_path) and placed_objects[scene_path].has(coords):
		return false
		
	# 2. Check FarmManager (Crops) - Only relevant in farming scenes?
	# For now assume FarmManager is global but data might be scene specific later.
	if FarmManager.farm_data.has(coords):
		return false
		
	# 3. Check Range from Player
	if current_placeable_data.max_range > 0:
		var player = get_tree().get_first_node_in_group("player")
		if player:
			var player_tile = tilemap.local_to_map(player.global_position)
			var dist = Vector2(coords - player_tile).length()
			if dist > current_placeable_data.max_range:
				return false
			
	# 4. Check Collision (Physics Query)
	var space_state = tilemap.get_world_2d().direct_space_state
	var query = PhysicsPointQueryParameters2D.new()
	query.position = tilemap.map_to_local(coords)
	query.collide_with_bodies = true
	query.collide_with_areas = true
	
	var results = space_state.intersect_point(query)
	for result in results:
		var collider = result["collider"]
		if collider.is_in_group("player"):
			return false
		if collider.is_in_group("placeable") or collider.is_in_group("interactable"):
			return false
	
	return true

func restore_placed_objects(_tilemap: TileMapLayer, _parent: Node2D):
	tilemap = _tilemap
	parent_node = _parent
	
	var current_scene = get_tree().current_scene
	if not current_scene: return
	
	var scene_path = current_scene.scene_file_path
	if not placed_objects.has(scene_path):
		return
		
	var scene_objects = placed_objects[scene_path]
	
	# Iterate placed_objects and spawn
	for coords in scene_objects:
		var data = scene_objects[coords]
		var item_id = data["id"]
		var custom_data = data["custom_data"]
		
		# Resolve Item Data via ItemDatabase
		var item = ItemDatabase.get_item(item_id) as PlaceableData
		if not item or not item.placeable_scene:
			printerr("BuildManager: Failed to restore object ID: ", item_id)
			continue
			
		var instance = item.placeable_scene.instantiate()
		instance.global_position = tilemap.map_to_local(coords)
		
		parent_node.add_child(instance)
		
		if instance.has_method("load_save_data"):
			instance.placeable_data = item
			instance.load_save_data(custom_data)
			instance.set_meta("grid_coords", coords)

func get_save_data() -> Dictionary:
	# Update runtime data from scene instances BEFORE saving
	# We rely on parent_node being set to the CURRENT scene's entity holder.
	if parent_node:
		var current_scene = get_tree().current_scene
		if current_scene:
			var scene_path = current_scene.scene_file_path
			
			for child in parent_node.get_children():
				if child.has_method("get_save_data") and child.has_meta("grid_coords"):
					var coords = child.get_meta("grid_coords")
					
					# Only update Key: Scene -> Key: Coords -> Key: custom_data
					if placed_objects.has(scene_path) and placed_objects[scene_path].has(coords):
						placed_objects[scene_path][coords]["custom_data"] = child.get_save_data()
	
	return placed_objects.duplicate()

func load_save_data(data: Dictionary):
	placed_objects = data

func _store_object_data(coords: Vector2i, data: Dictionary):
	var current_scene = get_tree().current_scene
	if not current_scene: return
	
	var scene_path = current_scene.scene_file_path
	if not placed_objects.has(scene_path):
		placed_objects[scene_path] = {}
	placed_objects[scene_path][coords] = data


func _disable_collision_recursive(node: Node):
	if node is CollisionShape2D or node is CollisionPolygon2D:
		node.disabled = true
	
	if node is CollisionObject2D:
		node.collision_layer = 0
		node.collision_mask = 0
		
	for child in node.get_children():
		_disable_collision_recursive(child)

func cancel_build():
	is_building = false
	if preview_instance:
		preview_instance.queue_free()
		preview_instance = null
		
	if build_callbacks.has("on_cancel"):
		build_callbacks["on_cancel"].call()
		
	build_callbacks = {}
	current_placeable_data = null
