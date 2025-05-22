extends Node

signal skill_point_used

var skill_data: SkillData


func _ready():
    skill_data = SaveManager.game_data.skill_data


func add_skill_point(amount: int):
    skill_data.skill_points += amount
    # SaveManager.save_game_data()


func use_skill_point(skill_name: String) -> bool:
    if skill_data.skill_points > 0:
        skill_data.skill_points -= 1
        skill_point_used.emit()
        skill_data.acquired_skills[skill_name] = \
        {"quantity": skill_data.acquired_skills.get(skill_name, {"quantity": 0})["quantity"] + 1}
        # SaveManager.save_game_data()
        return true
    else:
        print("Not enough skill points")
        return false


func get_skill_level(skill_name: String) -> int:
    var skill_data = SaveManager.game_data.skill_data
    if skill_data.acquired_skills.has(skill_name):
        return skill_data.acquired_skills[skill_name]["quantity"]
    return 0