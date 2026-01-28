extends Node

@onready var player_tower = get_tree().get_first_node_in_group("player")


func _ready():
	PlayerControlManager.set_control(player_tower)
	print("현재의 Playerble:", PlayerControlManager.current_player)

func _unhandled_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var current_player = PlayerControlManager.current_player
		if current_player and current_player.has_method("perform_action"):
			var hand_item = InventoryManager.equipped_hand_item
			if hand_item:
				current_player.perform_action(hand_item, current_player.get_global_mouse_position())