extends Area2D
class_name HitboxComponent

@export var damage : float = 0

var number_of_penetration = 0


func _ready():
    area_entered.connect(counting_penetration)


func counting_penetration(other_area: Area2D):
    if not other_area is HurtboxComponent:
        return
    # print("number_of_penetration: ", number_of_penetration)
    number_of_penetration += 1
    if number_of_penetration >= 1:
        owner.queue_free()