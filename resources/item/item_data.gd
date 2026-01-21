extends Resource
class_name ItemData

@export var name: String
@export var icon: Texture2D
@export var description: String
@export var max_stack: int = 1
@export var equipment_data: EquipmentData
@export var consumable_data: ConsumableData
@export var fertilizer_data: FertilizerData

# @export var quest_data: QuestItemData

enum InteractionType {POINT, DIRECTIONAL}
@export var interaction_type: InteractionType = InteractionType.POINT
@export var interaction_range: int = 1