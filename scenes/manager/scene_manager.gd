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


func change_scene(scene_path: String, spawn_tag: String = ""):
	if transition_layer == null:
		_setup_transition_layer()
	
	color_rect.mouse_filter = Control.MOUSE_FILTER_STOP # Block input during transition
	
	var tween = create_tween()
	tween.tween_property(color_rect, "modulate:a", 1.0, TRANSITION_DURATION)
	await tween.finished
	
	get_tree().change_scene_to_file(scene_path)
	
	# Wait one frame to ensure the new scene is fully loaded and ready
	await get_tree().process_frame
	# Wait for physics frame to ensure groups and nodes are fully registered
	await get_tree().physics_frame
	
	_handle_spawn_position(spawn_tag)
	
	tween = create_tween()

	tween.tween_property(color_rect, "modulate:a", 0.0, TRANSITION_DURATION)
	await tween.finished
	
	color_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE # Unblock input

func _handle_spawn_position(spawn_tag: String):
	if spawn_tag == "":
		return
		
	var player = get_tree().get_first_node_in_group("player")
	if not player:
		print("SceneManager: Player not found in group 'player'. Cannot set spawn position.")
		return
		
	var spawn_points = get_tree().get_nodes_in_group("spawn_points")
	var target_point = null
	
	for point in spawn_points:
		# Duck typing to avoid cyclic dependency or class registration issues
		if point.get("spawn_id") == spawn_tag:
			target_point = point
			break

			
	if target_point:
		player.global_position = target_point.global_position
		print("SceneManager: Player spawned at '%s' (%s)" % [spawn_tag, target_point.global_position])
	else:
		print("SceneManager: SpawnPoint with ID '%s' not found!" % spawn_tag)
