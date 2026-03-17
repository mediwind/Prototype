extends Node2D
class_name GatherableObject

@export_category("Gatherable Stats")
@export var max_health: int = 3
@export var required_tool_type: ToolData.ToolType = ToolData.ToolType.NONE


@export_category("Drops")
@export var item_drop_component: ItemDropComponent

# Components
@onready var sprite = $Sprite2D
@onready var shake_duration: float = 0.15
@onready var shake_magnitude: float = 2.0

var current_health: int

func _ready():
	current_health = max_health
	
func hit(damage: int, tool_type: ToolData.ToolType) -> void:
	if required_tool_type != ToolData.ToolType.NONE and tool_type != required_tool_type:
		_play_deflect_effect()
		print("Gatherable: Wrong tool type. Required: %s, Got: %s" % [required_tool_type, tool_type])
		return
		
	# Apply Damage
	current_health -= damage
	_play_hit_effect()
	
	print("Gatherable: Hit! HP: %d/%d" % [current_health, max_health])
	
	if current_health <= 0:
		_destroy_and_drop()

func _play_hit_effect():
	# Visual Shake
	var tween = create_tween()
	var original_pos = sprite.position
	
	tween.tween_property(sprite, "position", original_pos + Vector2(shake_magnitude, 0), shake_duration * 0.25)
	tween.tween_property(sprite, "position", original_pos - Vector2(shake_magnitude, 0), shake_duration * 0.25)
	tween.tween_property(sprite, "position", original_pos + Vector2(shake_magnitude * 0.5, 0), shake_duration * 0.25)
	tween.tween_property(sprite, "position", original_pos, shake_duration * 0.25)
	
	
func _play_deflect_effect():
	# Sound: Clank!
	# Visual: Text "Wrong Tool" ? 
	# For now, minimal wobble
	var tween = create_tween()
	tween.tween_property(sprite, "rotation_degrees", 5, 0.1)
	tween.tween_property(sprite, "rotation_degrees", -5, 0.1)
	tween.tween_property(sprite, "rotation_degrees", 0, 0.1)

func _destroy_and_drop():
	if item_drop_component:
		item_drop_component.drop_items()
	queue_free()
