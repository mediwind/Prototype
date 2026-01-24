extends EquipmentData
class_name ToolData

enum ToolType {
	NONE,
	HOE,
	WATERING_CAN,
	SCYTHE,
	AXE,
	PICKAXE
}

@export var tool_type: ToolType
@export var effect_radius: int = 1
@export var efficiency: int = 1 # Damage dealt to resources
@export var water_consumption: int = 1 # Future use
