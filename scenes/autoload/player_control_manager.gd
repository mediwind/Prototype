extends Node

var current_player: Node = null


func set_control(target: Node):
    if current_player and current_player.has_node("ControllableComponent"):
        current_player.get_node("ControllableComponent").set_control_active(false)
    current_player = target
    if current_player and current_player.has_node("ControllableComponent"):
        current_player.get_node("ControllableComponent").set_control_active(true)
    # 카메라 타겟팅 등도 여기서 처리 가능
    # 예: GameCamera.set_target(current_player)
