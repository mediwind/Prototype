extends Control

@onready var skill_points_label: Label = %SkillPointsLabel
@onready var skill_reset_label: Label = %SkillResetLabel
@onready var skill_reset_button: Button = %SkillResetButton

var skill_points: int:
	set(value):
		skill_points = value
		if skill_points_label:
			skill_points_label.text = "Skill Points: " + str(skill_points)


func _ready():
	add_to_group("skill_tree_ui")
	SkillManager.skill_point_used.connect(_on_skill_point_used)
	skill_reset_button.pressed.connect(_on_skill_reset_button_pressed)
	refresh_ui()


func refresh_ui():
	skill_points = SaveManager.game_data.skill_data.skill_points
	build_prerequisite_lines()


func _on_skill_point_used():
	refresh_ui()


func _on_skill_reset_button_pressed():
	get_tree().call_group("skill_button", "retrieve_skill_point")
	get_tree().call_group("skill_tree_ui", "refresh_ui")


func build_prerequisite_lines() -> void:
	_call_build_on_buttons(self)


func _call_build_on_buttons(node: Node) -> void:
	for child in node.get_children():
		if child is SkillButton:
			child.call_deferred("build_connection_line")
		else:
			_call_build_on_buttons(child)
