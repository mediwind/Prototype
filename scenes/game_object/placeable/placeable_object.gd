extends Node2D
class_name PlaceableObject

@export var placeable_data: Resource # Type: PlaceableData (Weakened to break cycle)

# Unique ID for persistence (e.g., generated UUID-like string or Coordinate-based)
# Since we use Grid Coordinates as Key in Town.gd, this ID might be secondary or internal.
var persistence_id: String = ""

func _ready():
	add_to_group("placeable")
	# Temporary: random ID if needed, but Town.gd will likely manage keys by coordinate.
	if persistence_id == "":
		persistence_id = str(randi())

func get_save_data() -> Dictionary:
	# Override in children (e.g., Chest returns inventory)
	return {}

func load_save_data(_data: Dictionary) -> void:
	# Override in children
	pass
