extends Resource
class_name SkillData

@export var skill_points: int = 0
@export var acquired_skills: Dictionary = {}
@export var equipped_skills: Dictionary = {} # { slot_index: int : skill_id: String }