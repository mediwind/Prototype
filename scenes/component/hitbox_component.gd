extends Area2D
class_name HitboxComponent

@export var damage : float = 0


func _ready():
    area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
    if not other_area is HurtboxComponent:
        return

    if owner is BaseBullet:
        owner.on_hit(other_area)