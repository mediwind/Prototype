extends Resource
class_name CropData

@export var id: String
@export var crop_name: String
@export_multiline var description: String

# Visual Configuration
@export var seed_coords: Array[Vector2i] = [] # Array for random seed visuals
@export var stage_coords: Array[Vector2i] = [] # Explicit coordinates for each growth stage

# Growth Configuration
@export var max_stage: int = 4
@export var growth_days_per_stage: int = 1

# Random Yield Configuration
@export var min_harvest: int = 1
@export var max_harvest: int = 1

# Harvest Tool Requirement
# "Hand": Can be harvested by clicking (even with tool equipped if implemented that way)
# "Scythe": Requires Scythe tool to be equipped and used
@export_enum("Hand", "Scythe") var harvest_tool: String = "Hand"

# Harvest Configuration
@export var harvest_item: ItemData # The item yielded when harvested
@export var regrow_stage: int = -1 # -1 means no regrow (destroy after harvest)
