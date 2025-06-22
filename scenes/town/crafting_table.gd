extends Area2D

@export var crafting_ui_scene: PackedScene

var player_in_area := false


func _ready():
    body_entered.connect(on_body_entered)
    body_exited.connect(on_body_exited)


func on_body_entered(body):
    if body.is_in_group("player"):
        player_in_area = true


func on_body_exited(body):
    if body.is_in_group("player"):
        player_in_area = false


func _input(event):
    if player_in_area and (event.is_action_pressed("ui_accept") or (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT and event.pressed)):
        show_crafting_ui()


func show_crafting_ui():
    if crafting_ui_scene:
        var crafting_ui = crafting_ui_scene.instantiate()
        var root = get_tree().get_root()
        var town_ui = root.get_node("Town/TownUI")

        if town_ui:
            town_ui.add_child(crafting_ui)
        else:
            root.add_child(crafting_ui)

        get_tree().paused = true # 게임 일시정지
