extends Node

signal stats_updated

var player_stat: StatData


func _ready():
	load_save_data()


func load_save_data():
	# Save File Check & Create if missing
	if SaveManager.game_data.stat_data == null:
		SaveManager.game_data.stat_data = StatData.new()
	
	# Refresh Reference
	player_stat = SaveManager.game_data.stat_data

	# Initialize defaults if empty
	if player_stat.stats.is_empty():
		var default_stats_template = StatData.new() # _init() called
		player_stat.stats = default_stats_template.stats.duplicate()
	
	# Recalculate based on current inventory (which should be refreshed first)
	recalculate_player_stats()


# 장비 슬롯의 아이템을 합산하여 스탯을 재계산
func recalculate_player_stats():
	# 1. 플레이어의 스탯을 StatData에 정의된 기본값으로 초기화합니다.
	var default_stats_template = StatData.new() # StatData._init()에 정의된 기본 스탯 구조 가져오기
	var new_stats: Dictionary = default_stats_template.stats.duplicate()

	# 2. 장착된 장비들의 스탯을 합산합니다.
	for slot in InventoryManager.get_equipment_slots():
		if slot.item_data and slot.item_data.equipment_data:
			var eq_effective_stats = slot.item_data.equipment_data.get_effective_stats() # 이제 equipment_data.stats를 반환
			for stat_name in eq_effective_stats.keys():
				if new_stats.has(stat_name): # StatData에 정의된 스탯인지 확인
					new_stats[stat_name] += eq_effective_stats[stat_name]
				else:
					# 필요하다면 StatData에 정의되지 않은 스탯이 장비에 있을 경우 경고 출력
					print("Warning: Equipment '%s' has undefined stat '%s'" % [slot.item_data.name, stat_name])
	
	player_stat.stats = new_stats
	print("Recalculated Stats: ", player_stat.stats)
	stats_updated.emit()