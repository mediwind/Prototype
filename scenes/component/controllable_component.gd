extends Node

signal control_enabled
signal control_disabled

@export var input_enabled: bool = true:
    set = set_input_enabled


func set_input_enabled(value):
    if input_enabled == value:
        return

    input_enabled = value

    if input_enabled:
        control_enabled.emit()
    else:
        control_disabled.emit()


func set_control_active(active: bool):
    # 그룹 관리
    if active:
        get_parent().add_to_group("player")
        print(get_parent().name + " added to group player")
    else:
        get_parent().remove_from_group("player")
        print(get_parent().name + " removed from group player")
    
    input_enabled = active
