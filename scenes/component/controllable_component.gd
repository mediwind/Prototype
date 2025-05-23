extends Node

@export var input_enabled: bool = true


func set_control_active(active: bool):
    # 그룹 관리
    if active:
        get_parent().add_to_group("player")
        print(get_parent().name + " added to group player")
    else:
        get_parent().remove_from_group("player")
        print(get_parent().name + " removed from group player")
    
    # 입력 활성화/비활성화 상태 설정
    # input_enabled = active
    # print(get_parent().name + " input_enabled set to: " + str(input_enabled))

    # 자동 공격 상태 전환 (부모 노드가 PlayerTower일 경우)
    # if get_parent().has_method("set_auto_attack_mode"):
        # get_parent().set_auto_attack_mode(not active)


# _input() 메서드는 사용하지 않거나, 필요하다면 다른 방식으로 구현합니다.
# 이전처럼 get_viewport().set_input_as_handled()를 사용하면 UI 문제를 다시 일으킬 수 있습니다.
# func _input(event):
#     pass