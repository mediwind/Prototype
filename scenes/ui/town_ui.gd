extends CanvasLayer

@export var currency_display_scene: PackedScene


func _ready():
	var currency_display = currency_display_scene.instantiate()
	add_child(currency_display)
