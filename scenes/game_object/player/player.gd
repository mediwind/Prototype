extends CharacterBody2D

signal shoot

@onready var shooting_range = $ShootingRange
@onready var shoot_cool_time = $ShootCooltime

const MAX_SPEED = 200

var can_shoot : bool


func _ready():
	can_shoot = true
	shoot_cool_time.timeout.connect(on_shoot_cool_time_timeout)


func _process(delta):
	var direction = get_movement_vector()
	velocity = direction * MAX_SPEED
	move_and_slide()

	global_rotation = global_position.direction_to(get_global_mouse_position()).angle() + PI / 2

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		print("Shooting!")
		var dir = get_global_mouse_position() - global_position
		var bullet_direction = atan2(dir.y, dir.x)
		shoot.emit(global_position, dir, bullet_direction)
		can_shoot = false
		shoot_cool_time.start()
		# check_shooting_range()


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	return Vector2(x_movement, y_movement).normalized()


# func check_shooting_range():
#     if shooting_range.is_colliding() and shooting_range.get_collider().is_in_group("enemy"):
#         shooting_range.get_collider().queue_free()
#         print("Enemy killed!")
#     else:
#         print("No enemy in range!")


func on_shoot_cool_time_timeout():
	can_shoot = true
