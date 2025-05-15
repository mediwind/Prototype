extends Control

@export var available_buildings: Array[PackedScene]

@onready var button_container = $VBoxContainer


func _ready():
    for building_scene in available_buildings:
        var btn = Button.new()
        btn.text = building_scene.resource_path.get_file().get_basename()
        btn.pressed.connect(func(): on_build_button_pressed(building_scene))
        button_container.add_child(btn)


func on_build_button_pressed(scene: PackedScene):
    BuildManager.start_build_mode(scene, Vector2i(2, 2), $"../../TileMapLayer")  # grid_size 예시


func _on_cancel_button_pressed():
    BuildManager.cancel_build()
