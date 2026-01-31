extends Node

@onready var soil_tile_map = $SoilTileMap
@onready var fertilizer_tile_map = $FertilizerTileMap # User needs to add this node
@onready var crop_tile_map = $CropTileMap

# UI Scenes are now managed by UIManager

func _ready():
	# Outdoors: Ensure Time flows normally
	if TimeManager:
		TimeManager.set_calendar_time_multiplier(1.0)
	
	# Connect Farming Signals
	FarmManager.crop_updated.connect(_on_crop_updated)
	FarmManager.crop_removed.connect(_on_crop_removed)
	FarmManager.soil_updated.connect(_on_soil_updated)
	FarmManager.daily_growth_tick.connect(_on_daily_growth_tick)
	
	# Connect Inventory Signals
	InventoryManager.hand_equipped.connect(_on_hand_equipped)
	# Initial Check
	_on_hand_equipped(InventoryManager.equipped_hand_item)
	
	# Restore Visuals from Persistence
	_refresh_all_visuals()
	
	# Restore Placed Objects (Chest, Furniture)
	BuildManager.restore_placed_objects(soil_tile_map, $Entities)


func _refresh_all_visuals():
	# 1. Restore Soil
	for coords in FarmManager.soil_data:
		_on_soil_updated(coords, FarmManager.soil_data[coords])
		
	# 2. Restore Crops
	for coords in FarmManager.farm_data:
		_on_crop_updated(coords, FarmManager.farm_data[coords])

func _on_hand_equipped(item: ItemData):
	if item:
		print("Town: Hand Equipped: ", item.name, " Type: ", item.get_class())
		if item.get_script():
			print("Town: Script Class: ", item.get_script().get_global_name())
			
	# Robust Check: Class Type OR Duck Typing (property check)
	if item and (item is PlaceableData or "placeable_scene" in item):
		print("Town: Starting Placement for ", item.name)
		
		# Define what happens when we place an object in Town (Cost: 1 Item)
		var on_success_callback = func(coords):
			print("Town: Object placed at ", coords, ". Consuming item.")
			InventoryManager.consume_equipped_item(1)
			
			# Check if we still have items to continue building
			if not InventoryManager.has_item(item, 1):
				BuildManager.cancel_build()
		
		var callbacks = {
			"on_success": on_success_callback
		}
		
		BuildManager.start_placing(item, soil_tile_map, $Entities, false, callbacks)
	else:
		# if item: print("Town: Item is NOT recognized as PlaceableData.")
		BuildManager.cancel_build()

@onready var player = $Entities/PlayerHuman
const INTERACTION_DISTANCE = 3.0 # Grid distance (Chebyshev)
const TILLED_SOIL_ATLAS_COORDS = Vector2i(6, 22) # Source ID 0 (Dry Tilled)
const WET_SOIL_ATLAS_COORDS = Vector2i(2, 5) # Source ID 2 (Wet Tilled)
const SOIL_SOURCE_ID = 0 # Default source (Dry)
const WET_SOIL_SOURCE_ID = 2 # Wet source
const CROP_SOURCE_ID = 1

@onready var collectable_scene = preload("res://scenes/game_object/loot/collectable_object.tscn")

func _unhandled_input(event):
	# Allow blocking if building
	if BuildManager.is_building:
		return

	if event is InputEventKey and event.pressed and event.keycode == KEY_T:
		print("Town: Debug Magic Build (Free Turret Mode)")
		# Create dummy data on the fly
		var dummy_data = PlaceableData.new()
		dummy_data.id = "magic_turret"
		dummy_data.name = "Magic Turret"
		# Use Chest scene as placeholder if Turret scene doesn't exist yet, or generic placeable
		# Assuming we want to test 'PlaceableObject'
		dummy_data.placeable_scene = load("res://scenes/game_object/placeable/chest/chest.tscn")
		
		# Free Building! No callbacks = No Cost.
		BuildManager.start_placing(dummy_data, soil_tile_map, $Entities, true, {})
		return

	if event is InputEventMouseButton and event.pressed:
		var mouse_pos = soil_tile_map.get_global_mouse_position()
		var player_pos = player.global_position
		
		# RIGHT CLICK: INTERACTION (Chest, NPC)
		if event.button_index == MOUSE_BUTTON_RIGHT:
			# Check for interactables at mouse position
			var space_state = soil_tile_map.get_world_2d().direct_space_state
			var query = PhysicsPointQueryParameters2D.new()
			query.position = mouse_pos
			query.collide_with_bodies = true
			query.collide_with_areas = true
			
			var results = space_state.intersect_point(query)
			for result in results:
				var collider = result["collider"]
				# Check distance?
				var dist = player_pos.distance_to(collider.global_position)
				if dist > 32.0: # 2 tiles approx (Comfortable close range)
					continue # Too far
					
				# Try interact
				var interact_result = null
				if collider.has_method("interact"):
					interact_result = collider.interact(player)
					get_viewport().set_input_as_handled()
				elif collider.get_parent().has_method("interact"):
					interact_result = collider.get_parent().interact(player)
					get_viewport().set_input_as_handled()
					
				# Handle Result
				if interact_result is InventoryData:
					if UIManager:
						UIManager.open_container_ui(interact_result)
				
				# If interaction happened, we return (only one interaction per click)
				if interact_result != null or (collider.has_method("interact") or collider.get_parent().has_method("interact")):
					return
					
		# LEFT CLICK: TOOL / FARMING
		elif event.button_index == MOUSE_BUTTON_LEFT:
			# Variables are already declared above
			var player_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(player_pos))
			var target_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(mouse_pos))
			
			var hand_item = InventoryManager.equipped_hand_item
			
			# PRIORITY 1: CHECK ITEM TYPE (POINT or DIRECTIONAL)
			if hand_item:
				# Directional Tool Logic
				if hand_item.equipment_data:
					var result = player.perform_action(hand_item, mouse_pos)
					if result:
						if result.get("type") == "melee":
							_check_farming_hit(result)
						return

				if hand_item.interaction_type == ItemData.InteractionType.DIRECTIONAL:
					pass

			# PRIORITY 2: POINT INTERACTION (Harvest / Till / Water)
			var diff = (target_coords - player_coords).abs()
			if diff.x > 1 or diff.y > 1:
				return # Too far


			if FarmManager.farm_data.has(target_coords):
				# Check Tool Requirement
				var crop_data = FarmManager.farm_data[target_coords]
				var resource = crop_data.get("resource") as CropData
				
				if resource:
					var tool_req = resource.harvest_tool # "Hand" or "Scythe"
					
					# If Scythe is required, Point-Clicking with Hand should fail or warn
					# Use Directional Input for Scythe!
					if tool_req == "Scythe":
						if not hand_item or hand_item.name != "Scythe":
							print("Farming: This crop needs a Scythe! (Use Directional Attack)")
							return
						else:
							# User point-clicked WITH Scythe. Allow it? 
							# User requested "Directional logic". But point click is precise.
							# Let's funnel it to Directional Logic for consistency ??
							# Or allow precise scything. Let's allow precise scything as backup.
							pass
					
					# Proceed to Harvest (Unified Function)
					if _try_harvest_crop(target_coords, hand_item):
						return

			# PRIORITY 2: USE TOOL
			if not hand_item:
				return
				
			# Tool Logic Removed (Moved to EquipmentActionHandler)
			# Only Seeds and Fertilizer remain here for now (Point Click)
			
			# SEED PLANTING LOGIC
			elif hand_item.crop_data:
				# VALIDATION 1: Is there a crop already?
				if FarmManager.farm_data.has(target_coords):
					print("Farming: Crop already exists here.")
					return
					
				# VALIDATION 2: Is the soil tilled? (Dry or Wet)
				var tile_atlas_coords = soil_tile_map.get_cell_atlas_coords(target_coords)
				var is_tilled = (tile_atlas_coords == TILLED_SOIL_ATLAS_COORDS) or (tile_atlas_coords == WET_SOIL_ATLAS_COORDS)
				
				if not is_tilled:
					print("Farming: Soil is not tilled.")
					return
					
				print("Farming: Planting ", hand_item.name, " at ", target_coords)
				FarmManager.add_crop(target_coords, hand_item)
				# CONSUMPTION: Remove 1 seed
				InventoryManager.consume_equipped_item(1)


			# FERTILIZER LOGIC
			elif hand_item.fertilizer_data:
				# VALIDATION 1: Is there a crop? (Maybe allowed, Stardew allows fertilizer before/after planting depending on game rules)
				# Let's keep it simple: Must be tilled soil.
				var tile_atlas_coords = soil_tile_map.get_cell_atlas_coords(target_coords)
				var is_tilled = (tile_atlas_coords == TILLED_SOIL_ATLAS_COORDS) or (tile_atlas_coords == WET_SOIL_ATLAS_COORDS)
				
				if not is_tilled:
					print("Farming: Must be tilled soil to fertilize.")
					return
					
				if FarmManager.apply_fertilizer(target_coords, hand_item.fertilizer_data):
					InventoryManager.consume_equipped_item(1)
					print("Farming: Applied fertilizer ", hand_item.name)
			
			else:
				print("Town Input: Item held but no action matched. Name: ", hand_item.name, " | FertilizerData: ", hand_item.fertilizer_data)

func spawn_harvest_drops(coords: Vector2i, item_data: ItemData, amount: int, quality: int = 0):
	# Calculate world position center of the tile
	var center_pos = soil_tile_map.map_to_local(coords)
	
	for i in range(amount):
		var drop = collectable_scene.instantiate()
		add_child(drop)
		
		# Set Data
		drop.setup_drop(item_data, 1, quality) # Drops stack of 1 individually
		
		# Animation Target: Random scatter around the tile
		var angle = randf() * TAU
		var distance = randf_range(16.0, 32.0)
		var offset = Vector2(cos(angle), sin(angle)) * distance
		var target_pos = center_pos + offset
		
		# Start Bounce
		drop.animate_drop(center_pos, target_pos)


func _on_crop_updated(coords: Vector2i, data: Dictionary):
	_update_tile_visual(coords, data)

func _on_crop_removed(coords: Vector2i):
	# Clear the tile
	crop_tile_map.erase_cell(coords)

func _check_farming_hit(result: Dictionary):
	# Grid Logic using Hit Data
	var direction = result["direction"]
	var range_val = result["range"]
	var player_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(player.global_position))
	
	# Approx Grid Direction
	var angle_snap = snapped(direction.angle(), PI / 2)
	var grid_dir = Vector2i(Vector2.RIGHT.rotated(angle_snap))
	
	for r in range(1, range_val + 2):
		var check_coords = player_coords + (grid_dir * r)
		var neighbors = [
			check_coords,
			check_coords + Vector2i(grid_dir.y, grid_dir.x),
			check_coords - Vector2i(grid_dir.y, grid_dir.x)
		]
		
		for nc in neighbors:
			if FarmManager.farm_data.has(nc):
				# Try Harvest (Implicitly allowed by Scythe action)
				_try_harvest_crop(nc, InventoryManager.equipped_hand_item)


func _try_harvest_crop(coords: Vector2i, _tool_item: ItemData) -> bool:
	var crop_data = FarmManager.farm_data[coords]
	var resource = crop_data.get("resource") as CropData
	if not resource: return false
	
	var is_scythe = false
	if _tool_item and _tool_item.equipment_data:
		var data = _tool_item.equipment_data
		if data is ToolData and data.tool_type == ToolData.ToolType.SCYTHE:
			is_scythe = true
			
	if not is_scythe:
		return false
	
	var harvested_item = FarmManager.harvest_crop(coords)
	if harvested_item:
		# Yield & Quality Logic
		var amount = randi_range(resource.min_harvest, resource.max_harvest)
		var modifiers = FarmManager.get_soil_modifiers(coords)
		var quality_boost = modifiers.get("quality_boost", 0.0)
		if SkillManager.has_skill("master_farmer"):
			quality_boost += 1.0
		
		var quality = 0
		var roll = randf() + quality_boost
		if roll > 0.7: quality = 2
		elif roll > 0.4: quality = 1
		
		spawn_harvest_drops(coords, harvested_item, amount, quality)
		return true
	
	return false


func _on_daily_growth_tick(updates: Dictionary):
	# Staggered Growth Effect (The "Pop")
	var coords_list = updates.keys()
	coords_list.shuffle()
	
	for coords in coords_list:
		if not is_inside_tree():
			return
			
		var data = updates[coords]
		await get_tree().create_timer(randf_range(0.05, 0.2)).timeout
		_update_tile_visual(coords, data)


func _update_tile_visual(coords: Vector2i, data: Dictionary):
	var atlas_coords = data.get("atlas_coords", Vector2i(0, 0))
	crop_tile_map.set_cell(coords, CROP_SOURCE_ID, atlas_coords)


func _on_soil_updated(coords: Vector2i, data: Dictionary):
	if not fertilizer_tile_map:
		return
		
	# Clear visuals first
	fertilizer_tile_map.erase_cell(coords)
	
	# 1. Base Soil State (Tilled / Watered)
	if data.get("tilled", false):
		var target_source_id = SOIL_SOURCE_ID
		var target_coords = TILLED_SOIL_ATLAS_COORDS
		
		if data.get("watered", false):
			target_source_id = WET_SOIL_SOURCE_ID
			target_coords = WET_SOIL_ATLAS_COORDS
		
		soil_tile_map.set_cell(coords, target_source_id, target_coords)
	else:
		pass
	
	# 2. Fertilizer Visuals
	var nutrients = data.get("nutrients", {})
	for type_key in nutrients:
		var fert = nutrients[type_key]
		var source_id = 3
		var type_col_base = 0
		var target_layer = fertilizer_tile_map # Default
		
		match fert["type"]:
			FertilizerData.FertilizerType.QUALITY:
				type_col_base = 0
				target_layer = fertilizer_tile_map
			FertilizerData.FertilizerType.SPEED:
				type_col_base = 3
				var speed_layer = get_node_or_null("SpeedGroTileMap")
				if speed_layer:
					target_layer = speed_layer
				else:
					pass
			_:
				continue
		
		var tier_row = fert["tier"] - 1
		if tier_row < 0: tier_row = 0
		
		var variation = (coords.x + coords.y) % 2
		var atlas_coords = Vector2i(type_col_base + variation, tier_row)
				
		target_layer.set_cell(coords, source_id, atlas_coords)
