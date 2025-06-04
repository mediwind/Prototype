extends Node

var player_stat: StatData


func _ready():
    # 세이브 파일에 stat_data가 없으면 새로 생성
    if SaveManager.game_data.stat_data == null:
        SaveManager.game_data.stat_data = StatData.new()
    player_stat = SaveManager.game_data.stat_data


# 장비 슬롯의 아이템을 합산하여 스탯을 재계산
func recalculate_player_stats():
    var new_stats := {}
    for slot in InventoryManager.get_equipment_slots():
        if slot.item_data and slot.item_data.equipment_data:
            var eq = slot.item_data.equipment_data
            # attack
            new_stats["attack"] = new_stats.get("attack", 0) + (eq.attack if "attack" in eq else 0)
            # defense
            new_stats["defense"] = new_stats.get("defense", 0) + (eq.defense if "defense" in eq else 0)
            # 앞으로 추가될 스탯도 여기에 합산
    player_stat.stats = new_stats
    print(StatManager.player_stat.stats) # 스탯 재계산 후 출력 (디버그용)