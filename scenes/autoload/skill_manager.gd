extends Node


func add_skill_point(amount: int):
    SaveManager.game_data.skill_data.skill_points += amount
    # SaveManager.save_game_data()


func use_skill_point(skill_name: String):
    if SaveManager.game_data.skill_data.skill_points > 0:
        SaveManager.game_data.skill_data.skill_points -= 1
        SaveManager.game_data.skill_data.acquired_skills[skill_name] = true
        # SaveManager.save_game_data()
    else:
        print("Not enough skill points")