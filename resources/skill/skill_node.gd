extends Resource
class_name SkillNodeResource

@export var skill_template: Resource # SkillTemplate 리소스를 직접 참조하도록 함
@export var skill_id: String = ""
@export var position: Vector2 = Vector2.ZERO
@export var prerequisites: Array = []
@export var tab_id: String = ""
@export var locked: bool = false
