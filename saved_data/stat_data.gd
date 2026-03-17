extends Resource
class_name StatData

@export var stats := {} # {"attack": 0, "defense": 0, ...}


func _init():
    # 초기화 시 기본 스탯 설정
    stats = {
        "attack": 0,
        # "defense": 0,
        # "health": 100,
        # "mana": 50,
        # "speed": 100,
        # "critical_chance": 0,
        # "critical_damage": 150
    }


func set_stat(stat_name: String, value: int):
    stats[stat_name] = value


func get_stat(stat_name: String) -> int:
    return stats.get(stat_name, 0)
