extends Resource
class_name EquipmentData

enum EquipmentSlotType {
    NONE,
    HELMET,
    ARMOR,
    GLOVES,
    BOOTS,
    WEAPON,
    SHIELD,
    ACCESSORY
}

@export var slot_type: EquipmentSlotType
@export var attack: int = 0
@export var defense: int = 0