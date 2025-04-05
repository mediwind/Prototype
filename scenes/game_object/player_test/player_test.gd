extends CharacterBody2D

var direction = Vector2.ZERO
const MAX_SPEED = 100

@onready var animation_tree = $AnimationTree


func _physics_process(delta: float) -> void:
    velocity = direction * MAX_SPEED
    move_and_slide()


func _process(delta: float) -> void:
    direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

    if direction != Vector2.ZERO:
        set_walking(true)
        update_blend_position()
    else:
        set_walking(false)


func set_walking(value: bool) -> void:
    animation_tree["parameters/conditions/is_walking"] = value
    animation_tree["parameters/conditions/idle"] = !value


func update_blend_position() -> void:
    animation_tree["parameters/Idle/blend_position"] = direction
    animation_tree["parameters/Walk/blend_position"] = direction