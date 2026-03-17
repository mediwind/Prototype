extends Area2D
class_name Portal

@export_file("*.tscn") var target_scene_path: String
@export var target_spawn_tag: String = ""

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node):
	if body.is_in_group("player"):
		# Check if SceneManager exists (Autoload) and has the method
		if SceneManager and SceneManager.has_method("change_scene"):
			print("Portal entered! Traveling to: %s @ %s" % [target_scene_path, target_spawn_tag])
			SceneManager.change_scene(target_scene_path, target_spawn_tag)
		else:
			printerr("SceneManager not found or method missing!")
