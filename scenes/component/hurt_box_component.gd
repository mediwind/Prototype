extends Area2D
class_name HurtboxComponent

@export var health_component: Node

var floating_text_scene = preload("res://scenes/ui/floating_text.tscn")


func _ready():
    area_entered.connect(on_area_entered)


func on_area_entered(other_area: Area2D):
    if not other_area is HitboxComponent:
        return

    if health_component == null:
        return

    var hitbox_component = other_area as HitboxComponent
    handle_hit(hitbox_component.damage)


func handle_hit(damage_amount: float):
    if health_component == null:
        return
    
    health_component.damage(damage_amount)
    
    # Floating Text is now handled by FloatingTextSpawner via HealthComponent signals.