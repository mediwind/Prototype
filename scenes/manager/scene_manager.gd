extends Node

const TRANSITION_DURATION = 0.5

var transition_layer: CanvasLayer
var color_rect: ColorRect


var system_menu_scene = preload("res://scenes/ui/system_menu/system_menu.tscn")
var system_menu_instance

func _ready():
	_setup_transition_layer()
	_setup_system_menu()


func _setup_system_menu():
	system_menu_instance = system_menu_scene.instantiate()
	add_child(system_menu_instance)
	# make sure it is closed initially
	system_menu_instance.close_menu()


func _setup_transition_layer():
	transition_layer = CanvasLayer.new()
	transition_layer.layer = 100 # Ensure it's on top of everything
	add_child(transition_layer)
	
	color_rect = ColorRect.new()
	color_rect.color = Color.BLACK
	color_rect.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE # Don't block input when transparent
	color_rect.modulate.a = 0.0 # Start transparent
	transition_layer.add_child(color_rect)


func change_scene(scene_path: String):
	if transition_layer == null:
		_setup_transition_layer()
	
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP # Block input during transition
	
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 1.0, TRANSITION_DURATION)
	await tween.finished
	
	get_tree().change_scene_to_file(scene_path)
	
	tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 0.0, TRANSITION_DURATION)
	await tween.finished
	
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE # Unblock input
