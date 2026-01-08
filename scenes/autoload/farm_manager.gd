extends Node

# Key: Vector2i (Grid Coordinates), Value: Dictionary (Crop Data)
var farm_data: Dictionary = {}

# Configuration
# "seed_coords": Array of visual coordinates for Stage 0 (Seeds) to allow randomization
# "stage_coords": Array of coordinates for Stage 1, Stage 2, etc. (Ordered)
# This handles irregular sequences (e.g. jumping Y rows for tall crops)
const CROP_MAPPING = {
	"Corn Seed": {
		"seed_coords": [Vector2i(8, 15), Vector2i(9, 15)],
		"stage_coords": [
			Vector2i(10, 15), # Stage 1 (Sprout)
			Vector2i(11, 15), # Stage 2 (Growing)
			Vector2i(12, 14), # Stage 3 (Tall - Merged Tile starts at Y=14)
			Vector2i(13, 14), # Stage 4 (Tall/Ripe)
			Vector2i(14, 14), # Stage 5 (Ripe - if needed)
			Vector2i(15, 14) # Post-Harvest (if needed)
		],
		"max_stage": 5,
		"growth_days_per_stage": 1
	}
}

signal crop_updated(coords: Vector2i, data: Dictionary)
# Signal for a batch of updates (for staggered visual effect)
signal daily_growth_tick(growth_results: Dictionary)

func _ready():
	# Connect to TimeManager for daily updates
	if TimeManager:
		TimeManager.day_passed.connect(_on_day_passed)

func add_crop(coords: Vector2i, seed_data: ItemData) -> void:
	if farm_data.has(coords):
		return
	
	if not CROP_MAPPING.has(seed_data.name):
		printerr("FarmManager: No mapping found for seed: ", seed_data.name)
		return

	var crop_config = CROP_MAPPING[seed_data.name]
	
	# Initial Visual Calculation (Stage 0) with Randomization
	var initial_atlas_coords = Vector2i(0, 0)
	if crop_config.has("seed_coords") and crop_config.seed_coords is Array:
		initial_atlas_coords = crop_config.seed_coords.pick_random()
	
	var data = {
		"id": seed_data.name,
		"stage": 0,
		"max_stage": crop_config.max_stage,
		"atlas_coords": initial_atlas_coords, # Store the precise visual coordinate
		"growth_per_stage": crop_config.growth_days_per_stage,
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

# Helper function to calculate visuals based on stage
func _get_growth_atlas_coords(crop_id: String, stage: int) -> Vector2i:
	if not CROP_MAPPING.has(crop_id):
		return Vector2i(0, 0)
		
	var config = CROP_MAPPING[crop_id]
	if stage == 0:
		return config.seed_coords[0] # Should typically rely on stored value, but fallback here
	else:
		# Use the explicit list
		# stage 1 corresponds to index 0 in stage_coords
		var index = stage - 1
		if index >= 0 and index < config.stage_coords.size():
			return config.stage_coords[index]
		
		return Vector2i(0, 0) # Error fallback

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
				data["atlas_coords"] = _get_growth_atlas_coords(data["id"], data["stage"])
		else:
			# Not watered logic, just visual update for dry soil if we tracked soil wetness here
			changed = true
			
		if changed:
			updates[coords] = data.duplicate()
			
	if not updates.is_empty():
		emit_signal("daily_growth_tick", updates)
