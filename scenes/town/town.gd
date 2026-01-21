extends Node

@onready var skill_ui_button = $TownUI/HBoxContainer/SkillUIButton
@onready var inventory_ui_button = $TownUI/HBoxContainer/InventoryUIButton
@onready var soil_tile_map = $SoilTileMap
@onready var fertilizer_tile_map = $FertilizerTileMap # User needs to add this node
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
	FarmManager.crop_removed.connect(_on_crop_removed)
	FarmManager.soil_updated.connect(_on_soil_updated) # New connection
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

@onready var collectable_scene = preload("res://scenes/game_object/loot/collectable_object.tscn")

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# Common Logic: Position Checks
		var mouse_pos = soil_tile_map.get_global_mouse_position()
		var player_pos = player.global_position
		var player_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(player_pos))
		var target_coords = soil_tile_map.local_to_map(soil_tile_map.to_local(mouse_pos))
		
		var hand_item = InventoryManager.equipped_hand_item
		
		# PRIORITY 1: CHECK ITEM TYPE (POINT or DIRECTIONAL)
		# PRIORITY 1: CHECK ITEM TYPE (POINT or DIRECTIONAL)
		if hand_item:
			# Directional Tool Logic (Scythe, Weapon) -> Handled by EquipmentActionHandler
			# We check if it HAS EquipmentData -> WeaponData
			if hand_item.equipment_data and hand_item.equipment_data is WeaponData:
				var result = player.perform_action(hand_item, mouse_pos)
				if result and result.get("type") == "melee":
					_check_farming_hit(result)
				return
 
			# Fallback for old DIRECTIONAL check if needed, or remove.
			if hand_item.interaction_type == ItemData.InteractionType.DIRECTIONAL:
				# Legacy path if not using WeaponData yet? 
				# Our plan is Scythe uses WeaponData. So this block handles Scythe.
				pass

			# Point-Click Logic (Hoe, Watering Can) follows regular flow...
		
		# PRIORITY 2: POINT INTERACTION (Harvest / Till / Water)
		# NOTE: Harvest is now context-sensitive. If hand is empty or tool matches.
		
		# Validation: Distance Check for Point Interaction
		var diff = (target_coords - player_coords).abs()
		if diff.x > 1 or diff.y > 1:
			return # Too far for point interaction

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
			
		# Interaction Logic
		if hand_item.name == "Hoe":
			# Validation: Is this tile tillable?
			var tile_data = soil_tile_map.get_cell_tile_data(target_coords)
			if tile_data and tile_data.get_custom_data("is_tillable"):
				print("Farming: Tilling soil at ", target_coords)
				# Set the soil layer to Tilled Soil
				soil_tile_map.set_cell(target_coords, SOIL_SOURCE_ID, TILLED_SOIL_ATLAS_COORDS)
			else:
				print("Farming: Cannot till here.")
			
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


		# FERTILIZER LOGIC
		elif hand_item.fertilizer_data:
			# VALIDATION 1: Is there a crop? (Maybe allowed, Stardew allows fertilizer before/after planting depending on game rules)
			# Stardew: Only on tilled soil, before sprout stage?
			# Let's keep it simple: Must be tilled soil.
			var tile_atlas_coords = soil_tile_map.get_cell_atlas_coords(target_coords)
			if tile_atlas_coords != TILLED_SOIL_ATLAS_COORDS:
				print("Farming: Must be tilled soil to fertilize.")
				return
				
			if FarmManager.apply_fertilizer(target_coords, hand_item.fertilizer_data):
				InventoryManager.consume_equipped_item(1)
				# TODO: Play sound / visual effect
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
	
	# Auto-pass if tool matches requirement or if no requirement
	# Scythe req is checked by caller for Point mode, but Directional mode implies Scythe usage.
	
	var harvested_item = FarmManager.harvest_crop(coords)
	if harvested_item:
		# Yield & Quality Logic... (Extracted from previous code)
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


func _on_soil_updated(coords: Vector2i, data: Dictionary):
	if not fertilizer_tile_map:
		return
		
	# Clear visuals first (both layers if we had them)
	fertilizer_tile_map.erase_cell(coords)
	# SpeedGroTileMap.erase_cell(coords) # TODO: Add this when user creates the node
	
	# Iterate all applied nutrients
	for type_key in data:
		# Check if it's a valid nutrient dict (not 'wet' or other keys)
		if typeof(data[type_key]) != TYPE_DICTIONARY or not data[type_key].has("type"):
			continue
			
		var fert = data[type_key]
		var source_id = 3
		
		var type_col_base = 0
		var target_layer = fertilizer_tile_map # Default
		
		match fert["type"]:
			FertilizerData.FertilizerType.QUALITY:
				type_col_base = 0
				target_layer = fertilizer_tile_map
			FertilizerData.FertilizerType.SPEED:
				type_col_base = 3
				# TODO: Switch to SpeedGroTileMap if user added it
				# For now, if we use the same layer, they will overwrite each other visually
				# User must add Layer 2 and assign it here
				# Let's check if the node exists (we need to add variable or get_node)
				var speed_layer = get_node_or_null("SpeedGroTileMap")
				if speed_layer:
					target_layer = speed_layer
				else:
					# Fallback: Just overwrite on same layer (Last one wins)
					pass
			_:
				continue
		
		var tier_row = fert["tier"] - 1
		if tier_row < 0: tier_row = 0
		
		var variation = (coords.x + coords.y) % 2
		var atlas_coords = Vector2i(type_col_base + variation, tier_row)
				
		target_layer.set_cell(coords, source_id, atlas_coords)
