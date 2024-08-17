extends Node

var skill_points = 0
var acquired_skills = []


func add_skill_point(amount: int):
    skill_points += amount


func use_skill_point(skill_name: String):
    if skill_points > 0:
        skill_points -= 1
        acquired_skills.append(skill_name)
    else:
        print("Not enough skill points")