extends Resource
class_name ConsumableData

enum ConsumableEffectType {
    HEAL_HP,
    HEAL_MP,
    BUFF_ATTACK,
    BUFF_DEFENSE,
    REMOVE_DEBUFF
}

@export var effect_type: ConsumableEffectType
@export var effect_value: int