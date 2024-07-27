extends Node

@export var bullet_scene : PackedScene


func _ready():
    var player = get_tree().get_first_node_in_group("player")
    player.shoot.connect(on_player_shoot)


func on_player_shoot(pos, dir, bullet_direction):
    var bullet = bullet_scene.instantiate()
    add_child(bullet)
    bullet.position = pos
    bullet.rotation = bullet_direction
    bullet.direction = dir.normalized()
