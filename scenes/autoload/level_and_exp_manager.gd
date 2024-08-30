extends Node

signal level_up


func add_experience(amount: int):
    SaveManager.game_data.level_and_exp_data.experience += amount
    check_and_level_up()
    # SaveManager.save_game_data()


func check_and_level_up():
    while SaveManager.game_data.level_and_exp_data.experience >= SaveManager.game_data.level_and_exp_data.required_experience:
        SaveManager.game_data.level_and_exp_data.experience -= SaveManager.game_data.level_and_exp_data.required_experience
        SaveManager.game_data.level_and_exp_data.level += 1
        SaveManager.game_data.level_and_exp_data.required_experience = int(SaveManager.game_data.level_and_exp_data.required_experience * 1.5)
        SkillManager.add_skill_point(1)
        level_up.emit(SaveManager.game_data.level_and_exp_data.level, SaveManager.game_data.level_and_exp_data.required_experience)
        print("Level up! Level: ", SaveManager.game_data.level_and_exp_data.level, " Required Experience: ", SaveManager.game_data.level_and_exp_data.required_experience, " Skill Points: ", SaveManager.game_data.skill_data.skill_points)