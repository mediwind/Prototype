extends Node
class_name KnockbackComponent

@export var velocity_component: Node # Optional: Direct reference if needed, but we might just use Owner's signals or checking
@export var decal: float = 10.0 # Friction/Deceleration

var knockback_velocity: Vector2 = Vector2.ZERO

func apply_impulse(force: Vector2):
	knockback_velocity = force

func _physics_process(delta):
	if knockback_velocity.length() > 0:
		knockback_velocity = knockback_velocity.lerp(Vector2.ZERO, decal * delta)
		if knockback_velocity.length() < 10.0: # Threshold
			knockback_velocity = Vector2.ZERO

func get_current_velocity() -> Vector2:
	return knockback_velocity

func is_active() -> bool:
	return knockback_velocity.length() > 0
