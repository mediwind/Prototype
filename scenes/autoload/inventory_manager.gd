extends Node

var player_items: Array = []


func _ready():
    # 누락 시 자동 생성
    if SaveManager.game_data.inventory_data == null:
        SaveManager.game_data.inventory_data = InventoryData.new()
    player_items = SaveManager.game_data.inventory_data.slots


func add_item(item_data: ItemData, amount: int) -> void:
    pass


func remove_item(item_data: ItemData, amount: int) -> void:
    pass


func get_items() -> Array:
    return player_items