extends Resource
class_name SkillTreeResource

@export var id: String = ""
@export var title: String = ""
@export var icon: Texture2D
@export var nodes: Array = [] # SkillNodeResource 배열
@export var locked: bool = false
