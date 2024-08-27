extends Control


func _input(event):
    # when the player presses the escape key, unpause the game and remove the skill tree
    if event is InputEventKey and event.keycode == KEY_ESCAPE:
        get_tree().paused = false
        queue_free()