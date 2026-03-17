class_name NPCMovementComponent
extends Node

@export var move_speed: float = 60.0
@export var stop_threshold: float = 2.0

var _body: CharacterBody2D
var _target_position: Vector2
var _is_moving: bool = false

func _ready() -> void:
	# Expecting the parent to be the CharacterBody2D
	_body = get_parent() as CharacterBody2D
	if not _body:
		push_error("NPCMovementComponent must be a child of CharacterBody2D")
		set_physics_process(false)

func _physics_process(_delta: float) -> void:
	if not _is_moving or not _body:
		return
		
	var current_pos = _body.global_position
	var distance = current_pos.distance_to(_target_position)
	
	if distance <= stop_threshold:
		stop()
		return
	
	var direction = (_target_position - current_pos).normalized()
	_body.velocity = direction * move_speed
	_body.move_and_slide()

var current_target_position: Vector2:
	get:
		return _target_position

func move_to(target: Vector2) -> void:
	_target_position = target
	_is_moving = true

func stop() -> void:
	_is_moving = false
	if _body:
		_body.velocity = Vector2.ZERO
