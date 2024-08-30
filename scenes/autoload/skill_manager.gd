extends Node


func add_skill_point(amount: int):
    var skill_data = SaveManager.game_data.skill_data
    skill_data.skill_points += amount
    # SaveManager.save_game_data()


func use_skill_point(skill_name: String):
    var skill_data = SaveManager.game_data.skill_data
    if skill_data.skill_points > 0:
        skill_data.skill_points -= 1
        skill_data.acquired_skills[skill_name] = true
        # SaveManager.save_game_data()
    else:
        print("Not enough skill points")