extends CharacterBody2D
class_name NPC

# --- Configuration ---
@export_group("Identity")
@export var identity: NPCIdentity

@export_group("Dialogue")
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

@export_group("Components")
@onready var movement_component: NPCMovementComponent = $NPCMovementComponent
@onready var scheduler_component: NPCSchedulerComponent = $NPCSchedulerComponent
@onready var interaction_area: Area2D = $InteractionArea

# --- State ---
var player_nearby: bool = false
# Destinations for this scene can be assigned in editor or found dynamically
# Key: Activity ID, Value: Marker2D or Position node
@export var schedule_destinations: Dictionary = {}

func _ready() -> void:
	if interaction_area:
		interaction_area.body_entered.connect(_on_body_entered)
		interaction_area.body_exited.connect(_on_body_exited)
	else:
		push_warning("NPC %s missing InteractionArea!" % name)
		
	if scheduler_component and identity and identity.schedule:
		# Initialize scheduler with identity's schedule and local destinations
		scheduler_component.initialize(identity.schedule, schedule_destinations)

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
	var char_name = name
	if identity:
		char_name = identity.display_name
		
	print("Interacting with %s" % char_name)
	
	# Guard: If no dialogue resource, just return (Ambient NPC)
	if not dialogue_resource:
		print("%s has nothing to say." % char_name)
		return
	
	if movement_component:
		movement_component.stop()
	
	# Load Custom Balloon
	var balloon = load("res://scenes/ui/dialogue/custom_balloon.tscn").instantiate()
	get_tree().root.add_child(balloon)
	
	# Start Dialogue
	balloon.start(dialogue_resource, dialogue_start, [self])
	
	# Resume movement after dialogue ends
	# We use the global signal from DialogueManager
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended, CONNECT_ONE_SHOT)

func _on_dialogue_ended(_resource: DialogueResource) -> void:
	# Resume schedule (force move to current target)
	if scheduler_component and TimeManager:
		scheduler_component.check_schedule(TimeManager.current_hour, true)
