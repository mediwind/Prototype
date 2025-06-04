extends Area2D


func _ready() -> void:
    body_entered.connect(on_body_entered)


func on_body_entered(body: Node) -> void:
    print("Battle entrance body entered: ", body.name)
    if body.is_in_group("player"):
        get_tree().call_deferred("change_scene_to_file", "res://scenes/main/main.tscn")