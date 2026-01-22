extends EquipmentData
class_name ToolData

enum ToolType {
	HOE,
	WATERING_CAN,
	SCYTHE
}

@export var tool_type: ToolType
@export var effect_radius: int = 1
@export var water_consumption: int = 1 # Future use
