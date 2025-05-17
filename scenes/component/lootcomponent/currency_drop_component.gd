extends Node

@export var health_component: Node
@export var currency_drop_infos: Array[CurrencyDropInfo]  # CurrencyDropInfo 리소스 배열


func _ready():
	(health_component as HealthComponent).died.connect(on_died)


func on_died():
	if not owner is Node2D:
		return

	for drop_info in currency_drop_infos:
		if randf() <= drop_info.drop_percent:
			var amount = randi_range(drop_info.min_amount, drop_info.max_amount)
			if amount > 0:
				CurrencyManager.add_currency(drop_info.currency_type, amount, true)
				# print("owner: ", owner.name, " dropped ", amount, " ", drop_info.currency_type)
				print("now_battle_currencies: ", CurrencyManager.battle_currencies)