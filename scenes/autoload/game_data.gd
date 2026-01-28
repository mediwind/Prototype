extends Resource
class_name GameData

@export var currency_data: CurrencyData
@export var skill_data: SkillData
@export var level_and_exp_data: LevelAndExpData
@export var inventory_data: InventoryData
@export var stat_data: StatData
@export var farm_save_data: Dictionary = {}
@export var placed_objects_data: Dictionary = {} # Key: Vector2i (Coords), Value: Dictionary (ID, CustomData)
@export var time_save_data: Dictionary = {}
