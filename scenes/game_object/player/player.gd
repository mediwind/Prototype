extends CharacterBody2D

signal shoot

@onready var shoot_cool_time = $ShootCooltime
@onready var player_sprite = $PlayerSprite
@onready var arm_front = $PlayerSprite/Torso/ArmFront
@onready var arm_back = $PlayerSprite/Torso/ArmBack
@onready var hand = $PlayerSprite/Torso/ArmFront/Hand
@onready var aim_pivot = $AimPivot
@onready var animation_player = $AnimationPlayer

const MAX_SPEED = 200

var can_shoot : bool
var facing_right : bool


func _ready():
	can_shoot = true
	shoot_cool_time.timeout.connect(on_shoot_cool_time_timeout)


func _process(delta):
	handle_movement()
	update_sprite_direction()
	rotate_arms()
	update_animation()

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		print("Shooting!")
		var dir = get_global_mouse_position() - hand.global_position
		var bullet_direction = atan2(dir.y, dir.x)
		print("hand_position:", hand.global_position)
		shoot.emit(hand.global_position, dir, bullet_direction)
		can_shoot = false
		shoot_cool_time.start()


# Handle player movement based on input
func handle_movement():
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * MAX_SPEED
	move_and_slide()


# Get the movement vector based on input actions
func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")

	return Vector2(x_movement, y_movement)


# Update the sprite direction based on the mouse position
func update_sprite_direction():
	var mouse_position = get_global_mouse_position()
	if mouse_position.x >= global_position.x:
		player_sprite.scale.x = 1
		facing_right = true
	else:
		player_sprite.scale.x = -1
		facing_right = false


# Rotate the arms to face the mouse position
func rotate_arms():
	var mouse_position = get_global_mouse_position()
	arm_front.look_at(mouse_position)
	arm_back.look_at(hand.global_position)


# Update the animation based on the movement vector
func update_animation():
	var movement_vector = get_movement_vector()
	if movement_vector.x == 0:
		if movement_vector.y != 0:
			animation_player.play("walk_forward")
		else:
			animation_player.play("RESET")
	else:
		if movement_vector.x > 0:
			if facing_right:
				animation_player.play("walk_forward")
			else:
				animation_player.play("walk_backward")
		else:
			if facing_right:
				animation_player.play("walk_backward")
			else:
				animation_player.play("walk_forward")


func on_shoot_cool_time_timeout():
	can_shoot = true
