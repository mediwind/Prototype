extends Node2D
class_name FloatingTextSpawner

@export var health_component: HealthComponent

var floating_text_scene = preload("res://scenes/ui/floating_text.tscn")

func _ready():
	if health_component:
		health_component.health_changed.connect(on_health_changed)

func on_health_changed(_current_health: float, change_amount: float):
	if change_amount == 0:
		return
		
	var floating_text = floating_text_scene.instantiate() as Node2D
	get_tree().get_first_node_in_group("foreground_layer").add_child(floating_text)
	
	floating_text.global_position = global_position + (Vector2.UP * 16)
	
	var format_string = "%0.0f"
	if abs(change_amount) < 1.0 and change_amount != 0:
		format_string = "%0.1f"
	
	var text_content = format_string % abs(change_amount)
	
	# Color Logic
	if change_amount > 0:
		# Heal: Green
		floating_text.modulate = Color(0.2, 0.8, 0.2)
		text_content = "+" + text_content
	else:
		# Damage: White (Default)
		floating_text.modulate = Color.WHITE
		
	floating_text.start(text_content)
