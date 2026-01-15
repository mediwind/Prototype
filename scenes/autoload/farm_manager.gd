extends Node

# Key: Vector2i (Grid Coordinates), Value: Dictionary (Runtime Crop Data + Reference to Resource)
var farm_data: Dictionary = {}
# Key: Vector2i (Grid Coordinates), Value: Dictionary { "fertilizer": { "type": 0, "tier": 1, ... } }
var soil_data: Dictionary = {}

# Registry for CropData resources
# Key: Seed Item Name (String), Value: CropData Resource
var crop_registry: Dictionary = {}

@export var available_crops: Array[CropData] = [] # Drag & Drop CropData resources here in Inspector

signal crop_updated(coords: Vector2i, data: Dictionary)
signal crop_removed(coords: Vector2i)
signal soil_updated(coords: Vector2i, data: Dictionary) # New signal for fertilizer
# Signal for a batch of updates (for staggered visual effect)
signal daily_growth_tick(growth_results: Dictionary)

func _ready():
	# Initialize Registry
	_build_crop_registry()
	
	# TEMPORARY TEST CODE: Force load Corn Crop since Autoload inspector is hard to access
	# User question: Why is this needed?
	# Answer: Autoloads are global script instances, not scenes in the editor. 
	# We cannot "Open" FarmManager in the inspector to drag-drop resources unless we make it a .tscn and autoload that.
	# For now, code-based loading is the fastest way to test without changing project structure.
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


func apply_fertilizer(coords: Vector2i, fertilizer: FertilizerData) -> bool:
	if not fertilizer:
		return false
	
	# Override Rule:
	# 1. Fertilizer Type Check: Co-existence allowed for DIFFERENT types.
	# 2. Tier Check: Only allow if new tier > existing tier (Upgrade). 
	#    (Same tier refreshing duration is also acceptable standard behavior)
	
	if not soil_data.has(coords):
		soil_data[coords] = {}
		
	# Use Nutrient Type as Key for Co-existence
	# Instead of single "fertilizer" key, use the keys: 0 (Quality), 1 (Speed), etc.
	var type_key = fertilizer.type
	
	if soil_data[coords].has(type_key):
		var existing = soil_data[coords][type_key]
		if existing["tier"] >= fertilizer.tier:
			print("FarmManager: Rejecting lower/equal tier fertilizer. Existing: ", existing["tier"], " New: ", fertilizer.tier)
			return false
	
	var data = {
		"type": fertilizer.type,
		"tier": fertilizer.tier,
		"effect_value": fertilizer.effect_value,
		"days_remaining": fertilizer.duration_days
	}
		
	soil_data[coords][type_key] = data
	
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
		for key in soil_data[coords]:
			var fert = soil_data[coords][key]
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
		# With Simple Logic (1 Day/Stage), setting to stage X means it waits for next day to go X+1
		emit_signal("crop_updated", coords, data)
	else:
		# Remove Crop
		farm_data.erase(coords)
		# Emit update with null/empty data to clear visual
		# We might need a specific way to tell Town to clear the tile
		# Passing null or empty dictionary?
		# Town.gd expects dictionary with 'atlas_coords'.
		# Let's emit a signal with a flag or handle "erase" in town.
		# Ideally: emit_signal("crop_removed", coords)?
		# Or just reuse crop_updated with a special flag?
		# Let's add 'crop_removed' signal or clear it.
		# For now, let's just emit crop_updated with empty dict and handle in town?
		# Or better: Add a remove_crop function.
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
		if data["watered"]:
			var modifiers = get_soil_modifiers(coords)
			var growth_speed = 1.0 + modifiers.get("speed_boost", 0.0)
			
			# Growth Point Logic Refactoring
			# Base: 1 Day = 100 Points
			# Modifiers: speed_boost adds percentage (e.g. 0.1 = +10% = 110 points)
			
			var base_daily_points = 100.0
			
			# Check Passive Skills (Polling)
			if SkillManager.has_skill("fast_grower"):
				growth_speed += 2.0 # +200% Growth Speed (Test Value)
				print("FarmManager: 'Fast Grower' passive active! Growth speed boosted.")
				
			var daily_growth = base_daily_points * growth_speed
			
			# Apply to accumulated points
			if not data.has("accumulated_growth_points"):
				data["accumulated_growth_points"] = 0.0
				
			data["accumulated_growth_points"] += daily_growth
			
			# Debug
			print("FarmManager: Crop at %s grew %.1f points. Total: %.1f" % [coords, daily_growth, data["accumulated_growth_points"]])
			
			data["watered"] = false # Reset water daily
			changed = true
			
			# Check for Stage Progression
			if data["stage"] < data["max_stage"]:
				# Calculate points needed for ONE stage
				# If crop_data says 1 day/stage, needed = 100.0. If 4 days, needed = 400.0
				var points_needed_for_next_stage = data["growth_per_stage"] * 100.0
				
				# While loop to handle massive growth spikes (e.g. debug cheats or super fertilizer)
				while data["accumulated_growth_points"] >= points_needed_for_next_stage:
					data["accumulated_growth_points"] -= points_needed_for_next_stage
					data["stage"] += 1
					
					# Update Visuals
					if data.has("resource"):
						data["atlas_coords"] = _get_growth_atlas_coords(data.resource, data["stage"])
					
					# Cap at max stage
					if data["stage"] >= data["max_stage"]:
						data["accumulated_growth_points"] = 0.0 # Clear overflow if maxed? Or keep it? keeping 0 is safer.
						break

		else:
			# Not watered logic, just visual update for dry soil if we tracked soil wetness here
			changed = true
			
		if changed:
			updates[coords] = data.duplicate()
			
	if not updates.is_empty():
		emit_signal("daily_growth_tick", updates)

	# Soil Decay Logic
	for coords in soil_data.keys():
		var keys_to_remove = []
		for type_key in soil_data[coords]:
			var fert = soil_data[coords][type_key]
			if fert["days_remaining"] > 0:
				fert["days_remaining"] -= 1
				if fert["days_remaining"] <= 0:
					keys_to_remove.append(type_key)
		
		if not keys_to_remove.is_empty():
			for key in keys_to_remove:
				soil_data[coords].erase(key)
			emit_signal("soil_updated", coords, soil_data[coords])
