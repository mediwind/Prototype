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

# --- added: prerequisite metadata (간단하고 직관적인 형식) ---
# @export var prerequisites: Array = [] # 스킬 id 문자열들의 배열, 빈 배열이면 선결 없음
# @export var prerequisite_mode: String = "all" # "all" 또는 "any"
# @export var required_prerequisites: int = 1 # mode == "any"일 때 필요한 개수 (기본 1)