extends CharacterBody2D

@onready var velocity_component = $VelocityComponent
@onready var visuals = $Visuals
@onready var knockback_component = $KnockbackComponent


func _process(delta):
	if knockback_component.is_active():
		velocity = knockback_component.get_current_velocity()
		move_and_slide()
	else:
		velocity_component.accelerate_to_player()
		velocity_component.move(self)

	var move_sign = sign(velocity.x)
	if move_sign != 0:
		visuals.scale = Vector2(-move_sign, 1)