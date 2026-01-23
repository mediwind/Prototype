extends Node

# Key: Vector2i (Grid Coordinates), Value: Dictionary (Runtime Crop Data + Reference to Resource)
var farm_data: Dictionary = {}
# Key: Vector2i (Grid Coordinates), Value: Dictionary { "tilled": bool, "watered": bool, "nutrients": { type_key: val } }
var soil_data: Dictionary = {}

# Registry for CropData resources
# Key: Seed Item Name (String), Value: CropData Resource
var crop_registry: Dictionary = {}

@export var available_crops: Array[CropData] = [] # Drag & Drop CropData resources here in Inspector

signal crop_updated(coords: Vector2i, data: Dictionary)
signal crop_removed(coords: Vector2i)
signal soil_updated(coords: Vector2i, data: Dictionary) # Data: { tilled, watered, nutrients }
# Signal for a batch of updates (for staggered visual effect)
signal daily_growth_tick(growth_results: Dictionary)

func _ready():
	# Initialize Registry
	_build_crop_registry()
	
	# TEMPORARY TEST CODE: Force load Corn Crop since Autoload inspector is hard to access
	var corn_crop = load("res://resources/farming/crops/corn_crop.tres")
	if corn_crop:
		crop_registry["Corn Seed"] = corn_crop
		print("FarmManager: Force loaded Corn Seed data.")
	
	# Connect to TimeManager for daily updates
	if TimeManager:
		TimeManager.day_passed.connect(_on_day_passed)


func _build_crop_registry() -> void:
	crop_registry.clear()
	for crop_data in available_crops:
		if crop_data:
			crop_registry[crop_data.id] = crop_data
	
	# Debug print
	print("FarmManager: Registered crops: ", crop_registry.keys())


func add_crop(coords: Vector2i, seed_data: ItemData) -> void:
	if farm_data.has(coords):
		return
	
	# Lookup resource in registry
	if not crop_registry.has(seed_data.name):
		printerr("FarmManager: No CropData found for seed: ", seed_data.name)
		return

	var crop_resource = crop_registry[seed_data.name]
	
	# Initial Visual Calculation (Stage 0) with Randomization
	var initial_atlas_coords = Vector2i(0, 0)
	if crop_resource.seed_coords.size() > 0:
		initial_atlas_coords = crop_resource.seed_coords.pick_random()
	
	var data = {
		"id": seed_data.name,
		"resource": crop_resource, # Store reference to the Resource
		"stage": 0,
		"max_stage": crop_resource.max_stage,
		"atlas_coords": initial_atlas_coords,
		"growth_per_stage": crop_resource.growth_days_per_stage,
		"watered": false,
		"accumulated_growth_points": 0.0 # Replaces days_grown
	}
	farm_data[coords] = data
	emit_signal("crop_updated", coords, data)


func water_crop(coords: Vector2i) -> void:
	if farm_data.has(coords):
		var data = farm_data[coords]
		if not data["watered"]:
			data["watered"] = true
			emit_signal("crop_updated", coords, data)


func till_soil(coords: Vector2i) -> bool:
	if not soil_data.has(coords):
		soil_data[coords] = {
			"tilled": true,
			"watered": false,
			"nutrients": {}
		}
		emit_signal("soil_updated", coords, soil_data[coords])
		return true
	else:
		if not soil_data[coords].get("tilled", false):
			soil_data[coords]["tilled"] = true
			emit_signal("soil_updated", coords, soil_data[coords])
			return true
	return false

func water_soil(coords: Vector2i) -> bool:
	if not soil_data.has(coords) or not soil_data[coords].get("tilled", false):
		return false # Cannot water untilled soil (Game Design Choice)
	
	if not soil_data[coords].get("watered", false):
		soil_data[coords]["watered"] = true
		emit_signal("soil_updated", coords, soil_data[coords])
		return true
	return false

func is_soil_tilled(coords: Vector2i) -> bool:
	return soil_data.has(coords) and soil_data[coords].get("tilled", false)

func is_soil_watered(coords: Vector2i) -> bool:
	return soil_data.has(coords) and soil_data[coords].get("watered", false)


func apply_fertilizer(coords: Vector2i, fertilizer: FertilizerData) -> bool:
	if not fertilizer:
		return false
	
	# Requirement: Must be tilled
	if not is_soil_tilled(coords):
		return false

	if not soil_data.has(coords):
		soil_data[coords] = {"tilled": true, "watered": false, "nutrients": {}} # Should exist if tilled check passed, but safety
		
	var nutrients = soil_data[coords]["nutrients"]
	
	# Override Rule:
	# 1. Fertilizer Type Check: Co-existence allowed for DIFFERENT types.
	# 2. Tier Check: Only allow if new tier > existing tier (Upgrade). 
	
	var type_key = fertilizer.type
	
	if nutrients.has(type_key):
		var existing = nutrients[type_key]
		if existing["tier"] >= fertilizer.tier:
			print("FarmManager: Rejecting lower/equal tier fertilizer. Existing: ", existing["tier"], " New: ", fertilizer.tier)
			return false
	
	var data = {
		"type": fertilizer.type,
		"tier": fertilizer.tier,
		"effect_value": fertilizer.effect_value,
		"days_remaining": fertilizer.duration_days
	}
		
	nutrients[type_key] = data
	
	print("FarmManager: Fertilizer applied at ", coords, " -> ", data)
	emit_signal("soil_updated", coords, soil_data[coords])
	return true


func get_soil_modifiers(coords: Vector2i) -> Dictionary:
	var modifiers = {
		"quality_boost": 0.0,
		"speed_boost": 0.0,
		"water_retention": 0.0
	}
	
	if soil_data.has(coords):
		var nutrients = soil_data[coords].get("nutrients", {})
		for key in nutrients:
			var fert = nutrients[key]
			# Validate it's a nutrient dictionary (simple check)
			if typeof(fert) == TYPE_DICTIONARY and fert.has("effect_value"):
				var val = fert["effect_value"]
				match fert["type"]:
					FertilizerData.FertilizerType.QUALITY:
						modifiers["quality_boost"] += val # Stack if multiple sources? Usually only 1 per type exists.
					FertilizerData.FertilizerType.SPEED:
						modifiers["speed_boost"] += val
					FertilizerData.FertilizerType.WATER_RETENTION:
						modifiers["water_retention"] += val
	return modifiers


func harvest_crop(coords: Vector2i) -> ItemData:
	if not farm_data.has(coords):
		return null
	
	var data = farm_data[coords]
	var resource = data.get("resource") as CropData
	
	if not resource:
		return null
		
	# Check if ripe
	if data["stage"] < resource.max_stage:
		return null # Not ready
		
	# Yield Item
	var drop_item = resource.harvest_item
	
	# Handle Regrow or Remove
	if resource.regrow_stage >= 0:
		# Regrow Logic
		data["stage"] = resource.regrow_stage
		# Use resource to update visual coordinate immediately
		data["atlas_coords"] = _get_growth_atlas_coords(resource, resource.regrow_stage)
		# Reset daily progress check implies we just need to wait for next day tick
		emit_signal("crop_updated", coords, data)
	else:
		# Remove Crop
		farm_data.erase(coords)
		emit_signal("crop_removed", coords)
		
	return drop_item


# Helper function to calculate visuals based on stage
func _get_growth_atlas_coords(crop_resource: CropData, stage: int) -> Vector2i:
	if not crop_resource:
		return Vector2i(0, 0)
		
	if stage == 0:
		if crop_resource.seed_coords.size() > 0:
			return crop_resource.seed_coords[0] # Fallback to first if random lost
		return Vector2i(0, 0)
	else:
		# Use the explicit list from Resource
		var index = stage - 1
		if index >= 0 and index < crop_resource.stage_coords.size():
			return crop_resource.stage_coords[index]
		
		return Vector2i(0, 0)


func _on_day_passed():
	var updates = {}
	
	for coords in farm_data.keys():
		var data = farm_data[coords]
		var changed = false
		
		# Growth Logic
		# Check if Watered (Required for growth)
		var is_watered = is_soil_watered(coords)
		
		if is_watered:
			var modifiers = get_soil_modifiers(coords)
			var growth_speed = 1.0 + modifiers.get("speed_boost", 0.0)
			
			# Growth Point Logic Refactoring
			var base_daily_points = 100.0
			
			# Check Passive Skills (Polling)
			if SkillManager.has_skill("fast_grower"):
				growth_speed += 2.0 # +200% Growth Speed
				print("FarmManager: 'Fast Grower' passive active! Growth speed boosted.")
				
			var daily_growth = base_daily_points * growth_speed
			
			if not data.has("accumulated_growth_points"):
				data["accumulated_growth_points"] = 0.0
				
			data["accumulated_growth_points"] += daily_growth
			
			print("FarmManager: Crop at %s grew %.1f points. Total: %.1f" % [coords, daily_growth, data["accumulated_growth_points"]])
			
			changed = true
			
			# Check for Stage Progression
			if data["stage"] < data["max_stage"]:
				var points_needed_for_next_stage = data["growth_per_stage"] * 100.0
				
				while data["accumulated_growth_points"] >= points_needed_for_next_stage:
					data["accumulated_growth_points"] -= points_needed_for_next_stage
					data["stage"] += 1
					
					# Update Visuals
					if data.has("resource"):
						data["atlas_coords"] = _get_growth_atlas_coords(data.resource, data["stage"])
					
					if data["stage"] >= data["max_stage"]:
						data["accumulated_growth_points"] = 0.0
						break
		else:
			print("FarmManager: Crop at %s did not grow (Not Watered)." % coords)
			
		if changed:
			updates[coords] = data.duplicate()
			
	if not updates.is_empty():
		emit_signal("daily_growth_tick", updates)

	# Soil Decay Logic
	for coords in soil_data.keys():
		var data = soil_data[coords]
		var soil_changed = false
		
		# 1. Reset Watered State (Dry out)
		# TODO: Check Water Retention fertilizer?
		if data.get("watered", false):
			data["watered"] = false
			soil_changed = true
		
		# 2. Nutrient Decay
		var nutrients = data.get("nutrients", {})
		var keys_to_remove = []
		for type_key in nutrients:
			var fert = nutrients[type_key]
			if fert["days_remaining"] > 0:
				fert["days_remaining"] -= 1
				if fert["days_remaining"] <= 0:
					keys_to_remove.append(type_key)
		
		if not keys_to_remove.is_empty():
			for key in keys_to_remove:
				nutrients.erase(key)
			soil_changed = true
			
		if soil_changed:
			emit_signal("soil_updated", coords, data)

# Persistence Strategy: "Loose Coupling"
# SaveManager collects this dictionary without knowing internal details.
func get_save_data() -> Dictionary:
	var save_data = {
		"farm_data": {},
		"soil_data": soil_data
	}
	
	# farm_data needs to be serialized because it contains complex inner dictionaries
	# We only save what's necessary to reconstruct the state
	for coords in farm_data:
		var crop_info = farm_data[coords]
		save_data["farm_data"][coords] = {
			"id": crop_info["id"],
			"stage": crop_info["stage"],
			"watered": crop_info["watered"],
			"accumulated_growth_points": crop_info.get("accumulated_growth_points", 0.0)
		}
	
	return save_data

func load_save_data(data: Dictionary) -> void:
	if not data:
		return
		
	# Race Condition Fix:
	# SaveManager might call this BEFORE FarmManager._ready() runs.
	# We must ensure the crop_registry is populated.
	if crop_registry.is_empty():
		print("FarmManager: Registry empty during load. Initializing now...")
		_build_crop_registry()
		
		# TEMPORARY TEST CODE RE-INJECTION (Important for Corn Seed test)
		var corn_crop = load("res://resources/farming/crops/corn_crop.tres")
		if corn_crop:
			crop_registry["Corn Seed"] = corn_crop
			print("FarmManager: Force loaded Corn Seed data (Lazy Load).")

	# 1. Restore Soil Data
	soil_data = data.get("soil_data", {})
	
	# 2. Restore Farm Data (Crops)
	farm_data.clear()
	var saved_farm_data = data.get("farm_data", {})
	
	for coords in saved_farm_data:
		var saved_crop = saved_farm_data[coords]
		var seed_name = saved_crop["id"]
		
		# Validate against registry
		if not crop_registry.has(seed_name):
			printerr("FarmManager: Failed to load crop '%s' at %s (Data missing)" % [seed_name, coords])
			continue
			
		var crop_resource = crop_registry[seed_name]
		var stage = saved_crop["stage"]
		
		# Reconstruct full runtime data
		var reconstructed_data = {
			"id": seed_name,
			"resource": crop_resource,
			"stage": stage,
			"max_stage": crop_resource.max_stage,
			"atlas_coords": _get_growth_atlas_coords(crop_resource, stage),
			"growth_per_stage": crop_resource.growth_days_per_stage,
			"watered": saved_crop["watered"],
			"accumulated_growth_points": saved_crop.get("accumulated_growth_points", 0.0)
		}
		
		farm_data[coords] = reconstructed_data
	
	print("FarmManager: Save data loaded. Crops: %d, Soil Tiles: %d" % [farm_data.size(), soil_data.size()])
	
	# Optional: Emit signals to update visuals immediately?
	# Usually the scene loading will query FarmManager, but if loading happens mid-game:
	# _refresh_all_visuals() # This would be nice to have
