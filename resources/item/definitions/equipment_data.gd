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
@export var stats := {} # {"attack": 10, "defense": 5, ...}


# 이 메서드는 이제 단순히 stats 딕셔너리의 복사본을 반환합니다.
func get_effective_stats() -> Dictionary:
    return stats.duplicate() # 외부에서의 수정을 방지하기 위해 복사본 반환