extends Area2D
class_name HitboxComponent

@export var damage: float = 0
@export var knockback_force: float = 0.0
# Used to calculate knockback direction (Source -> Target)
var source_position: Vector2 = Vector2.ZERO


func _ready():
    area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
    if not other_area is HurtboxComponent:
        return

    if owner.has_method("on_hit"):
        owner.on_hit(other_area)