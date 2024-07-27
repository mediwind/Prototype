extends Node2D

var speed : int = 1500
var direction : Vector2


func _process(delta):
    position += speed * direction * delta
    var viewport_rect = get_visible_screen_rect()
    if position.x < viewport_rect.position.x or position.x > viewport_rect.position.x + viewport_rect.size.x or position.y < viewport_rect.position.y or position.y > viewport_rect.position.y + viewport_rect.size.y:
        queue_free()


func get_visible_screen_rect():
    return get_viewport().get_visible_rect()