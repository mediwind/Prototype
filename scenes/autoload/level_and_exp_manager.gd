extends Node

signal level_up


func add_experience(amount: int):
    var level_and_exp_data = SaveManager.game_data.level_and_exp_data
    level_and_exp_data.experience += amount
    check_and_level_up(level_and_exp_data)
    # SaveManager.save_game_data()


func check_and_level_up(level_and_exp_data):
    while level_and_exp_data.experience >= level_and_exp_data.required_experience:
        level_and_exp_data.experience -= level_and_exp_data.required_experience
        level_and_exp_data.level += 1
        level_and_exp_data.required_experience = int(level_and_exp_data.required_experience * 1.5)
        SkillManager.add_skill_point(1)
        level_up.emit(level_and_exp_data.level, level_and_exp_data.required_experience)
        print("Level up! Level: ", level_and_exp_data.level, " Required Experience: ", level_and_exp_data.required_experience, " Skill Points: ", SaveManager.game_data.skill_data.skill_points)