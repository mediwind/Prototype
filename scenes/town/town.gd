extends Node

@onready var skill_ui_button = $TownUI/HBoxContainer/SkillUIButton
@onready var inventory_ui_button = $TownUI/HBoxContainer/InventoryUIButton
@onready var town_ui = $TownUI

@export var skill_tree_scene: PackedScene
@export var inventory_scene: PackedScene


func _ready():
	SaveManager.save_game_data()
	skill_ui_button.pressed.connect(on_skill_ui_button_pressed)
	inventory_ui_button.pressed.connect(on_inventory_ui_button_pressed)


func on_skill_ui_button_pressed():
	var skill_tree = skill_tree_scene.instantiate()
	town_ui.add_child(skill_tree)
	get_tree().paused = true


func on_inventory_ui_button_pressed():
	var inventory = inventory_scene.instantiate()
	town_ui.add_child(inventory)
	get_tree().paused = true
