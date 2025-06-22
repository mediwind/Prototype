extends PanelContainer

func _unhandled_input(event):
    if event.is_action_pressed("ui_cancel"):
        queue_free()
        get_tree().paused = false
