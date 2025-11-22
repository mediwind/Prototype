extends Resource
class_name SkillTemplate

@export var id: String = "not assigned yet"
@export var max_level: int = 1
@export var skill_point_cost: int = 1
@export var title: String = "not assigned yet"
@export_multiline var description: String = "not assigned yet"

@export var skill_type: String = "passive" # "active"|"passive"|"auto"|"conditional"
@export var cooldown: float = 0.0
@export var base_value: float = 0.0
@export var damage_type: String = "physical" # "physical","fire","ice",...
@export var icon: Texture2D
@export var cost: int = 0