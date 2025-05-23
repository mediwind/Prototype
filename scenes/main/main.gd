extends Node

@onready var player_tower = get_tree().get_first_node_in_group("player")


func _ready():
    PlayerControlManager.set_control(player_tower)
    print("현재의 Playerble:", PlayerControlManager.current_player)