extends Node

# Key: Vector2i (Grid Coordinates), Value: Dictionary (Runtime Crop Data + Reference to Resource)
var farm_data: Dictionary = {}

# Registry for CropData resources
# Key: Seed Item Name (String), Value: CropData Resource
var crop_registry: Dictionary = {}

@export var available_crops: Array[CropData] = [] # Drag & Drop CropData resources here in Inspector

signal crop_updated(coords: Vector2i, data: Dictionary)
signal crop_removed(coords: Vector2i)
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
		"days_grown": 0
	}
	farm_data[coords] = data
	emit_signal("crop_updated", coords, data)


func water_crop(coords: Vector2i) -> void:
	if farm_data.has(coords):
		var data = farm_data[coords]
		if not data["watered"]:
			data["watered"] = true
			emit_signal("crop_updated", coords, data)


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
			data["days_grown"] += 1
			data["watered"] = false # Reset water daily
			changed = true
			
			# Check needed days for next stage
			var current_stage_days = (data["days_grown"])
			
			if data["stage"] < data["max_stage"]:
				# If we have enough days for the NEXT stage (Simple: 1 Day = 1 Stage)
				data["stage"] += 1
				
				# Recalculate Visuals
				# Use the stored resource to get visuals
				if data.has("resource"):
					data["atlas_coords"] = _get_growth_atlas_coords(data.resource, data["stage"])

		else:
			# Not watered logic, just visual update for dry soil if we tracked soil wetness here
			changed = true
			
		if changed:
			updates[coords] = data.duplicate()
			
	if not updates.is_empty():
		emit_signal("daily_growth_tick", updates)
