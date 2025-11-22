extends Control

@onready var skill_points_label: Label = %SkillPointsLabel
@onready var skill_reset_label: Label = %SkillResetLabel
@onready var skill_reset_button: Button = %SkillResetButton
# Optional: SkillTree Resource를 연결하면 리소스 기반으로 UI를 생성합니다.
# (GraphEdit/GraphNode 실험을 보류했으므로 관련 자동 생성 코드는 제거됨)

var skill_points: int:
    set(value):
        skill_points = value
        skill_points_label.text = "Skill Points: " + str(skill_points)


func _ready():
    skill_points = SaveManager.game_data.skill_data.skill_points
    SkillManager.skill_point_used.connect(_on_skill_point_used)
    skill_reset_button.pressed.connect(_on_skill_reset_button_pressed)
    print(SaveManager.game_data.skill_data.acquired_skills)

    # 현재는 수동 배치된 `SkillButton` 씬을 사용합니다.


func _input(event):
    # when the player presses the escape key, unpause the game and remove the skill tree
    if event is InputEventKey and event.keycode == KEY_ESCAPE:
        get_tree().paused = false
        queue_free()


func _on_skill_point_used():
    skill_points = SaveManager.game_data.skill_data.skill_points


func _on_skill_reset_button_pressed():
    # Call retrieve_skill_point on all nodes in the "skill_button" group
    get_tree().call_group("skill_button", "retrieve_skill_point")
    # Update the skill points label
    skill_points = SaveManager.game_data.skill_data.skill_points
    skill_points_label.text = "Skill Points: " + str(skill_points)
    print("Skills have been reset and skill points refunded.")
