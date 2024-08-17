extends Node

signal level_up

var level = 1
var experience = 0
var required_experience = 5


func add_experience(amount: int):
    experience += amount
    check_and_level_up()


func check_and_level_up():
    while experience >= required_experience:
        experience -= required_experience
        level += 1
        required_experience = int(required_experience * 1.5)
        Skill.add_skill_point(1)
        level_up.emit(level, required_experience)
        print("Level up! Level: ", level, " Required Experience: ", required_experience, " Skill Points: ", Skill.skill_points)