extends ItemData
class_name PlaceableData

@export var placeable_scene: PackedScene
@export var place_size: Vector2i = Vector2i(1, 1) # Width, Height in tiles
@export var can_rotate: bool = false
@export var max_range: float = 5.0 # Maximum distance from player in tiles. 0 or less = Infinite.
