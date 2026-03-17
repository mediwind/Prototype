extends Node

@export var health_component: Node
@export var currency_drop_infos: Array[CurrencyDropInfo]

func _ready():
	# Explicit checks to avoid crash if HealthComponent is missing or broken
	if health_component and health_component.has_signal("died"):
		health_component.died.connect(on_died)

func on_died():
	if not owner is Node2D:
		return

	for drop_info in currency_drop_infos:
		if randf() <= drop_info.drop_percent:
			var amount = randi_range(drop_info.min_amount, drop_info.max_amount)
			if amount > 0:
				CurrencyManager.add_currency(drop_info.currency_type, amount, true)