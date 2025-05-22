extends Node

var player_items: Array = []


func _ready():
    player_items = SaveManager.game_data.inventory_data.slots


func add_item(item_data: ItemData, amount: int) -> void:
    pass


func remove_item(item_data: ItemData, amount: int) -> void:
    pass


func get_items() -> Array:
    return player_items