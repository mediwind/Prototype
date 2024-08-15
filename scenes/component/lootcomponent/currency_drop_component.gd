extends Node

enum CurrencyType { GOLD, FAITH, SOUL }

class CurrencyDropInfo:
	var drop_percent: float
	var amount_range: int
	var scene: PackedScene

	func _init(drop_percent: float, amount_range: int, scene: PackedScene):
		self.drop_percent = drop_percent
		self.amount_range = amount_range
		self.scene = scene

@export var health_component: Node

@export_range(0, 1) var gold_drop_percent: float = 0.5
@export_range(0, 1000, 1) var gold_amount_range: int = 10
@export var gold_scene: PackedScene

@export_range(0, 1) var faith_drop_percent: float = 0.3
@export_range(0, 1000, 1) var faith_amount_range: int = 5
@export var faith_scene: PackedScene

@export_range(0, 1) var soul_drop_percent: float = 0.2
@export_range(0, 1000, 1) var soul_amount_range: int = 3
@export var soul_scene: PackedScene


func _ready():
	(health_component as HealthComponent).died.connect(on_died)


func on_died():
	if not owner is Node2D:
		return
	
	var spawn_position = (owner as Node2D).global_position
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	
	var currency_drop_info = {
		CurrencyType.GOLD: CurrencyDropInfo.new(gold_drop_percent, gold_amount_range, gold_scene),
		CurrencyType.FAITH: CurrencyDropInfo.new(faith_drop_percent, faith_amount_range, faith_scene),
		CurrencyType.SOUL: CurrencyDropInfo.new(soul_drop_percent, soul_amount_range, soul_scene)
	}
	
	for currency_type in currency_drop_info.keys():
		var drop_info = currency_drop_info[currency_type]
		if randf() <= drop_info.drop_percent:
			var amount = randi_range(0, drop_info.amount_range)
			if amount > 0 and drop_info.scene:
				var currency_instance = drop_info.scene.instantiate() as Node2D
				entities_layer.add_child(currency_instance)
				currency_instance.amount = amount
				currency_instance.global_position = spawn_position
