extends Area2D
class_name NPC

# Simple dialogue resource export
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

var player_nearby: bool = false

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerHuman:
		player_nearby = true

func _on_body_exited(body: Node2D) -> void:
	if body is PlayerHuman:
		player_nearby = false

func _unhandled_input(event: InputEvent) -> void:
	if player_nearby and event.is_action_pressed("interact"):
		interact()
		get_viewport().set_input_as_handled()

func interact() -> void:
	print("Interacting with Talula")
	
	# Load Custom Balloon
	var balloon = load("res://scenes/ui/dialogue/custom_balloon.tscn").instantiate()
	get_tree().root.add_child(balloon)
	
	# Start Dialogue
	# We pass 'self' as an extra game state, so we can access Talula's properties in dialogue if needed
	balloon.start(dialogue_resource, dialogue_start, [self])
