extends Control

@onready var skill_points_label: Label = $SkillPointsLabel

var skill_points: int:
    set(value):
        skill_points = value
        skill_points_label.text = "Skill Points: " + str(skill_points)


func _ready():
    skill_points = SaveManager.game_data.skill_data.skill_points
    SkillManager.skill_point_used.connect(_on_skill_point_used)


func _input(event):
    # when the player presses the escape key, unpause the game and remove the skill tree
    if event is InputEventKey and event.keycode == KEY_ESCAPE:
        get_tree().paused = false
        queue_free()


func _on_skill_point_used():
    skill_points = SaveManager.game_data.skill_data.skill_points