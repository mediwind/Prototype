extends Node

var player_inventory_slots: Array = []
var player_hotbar_slots: Array = []


func _ready():
    if SaveManager.game_data.inventory_data == null:
        SaveManager.game_data.inventory_data = InventoryData.new()
    SaveManager.game_data.inventory_data.ensure_slots()
    player_inventory_slots = SaveManager.game_data.inventory_data.inventory_slots
    player_hotbar_slots = SaveManager.game_data.inventory_data.hotbar_slots


func add_item(item_data: ItemData, amount: int) -> int:
    var remaining = amount
    var max_stack = item_data.max_stack if "max_stack" in item_data else 99
    var added = 0

    # 1. 인벤토리 슬롯에 합치기
    for slot in player_inventory_slots:
        if slot.item_data and slot.item_data.name == item_data.name:
            var can_add = max_stack - slot.amount
            if can_add > 0:
                var to_add = min(remaining, can_add)
                slot.amount += to_add
                remaining -= to_add
                added += to_add
                if remaining <= 0:
                    return added

    # 2. 인벤토리 빈 슬롯에 새로 추가
    for slot in player_inventory_slots:
        if not slot.item_data:
            var to_add = min(remaining, max_stack)
            slot.item_data = item_data
            slot.amount = to_add
            remaining -= to_add
            added += to_add
            if remaining <= 0:
                return added

    # 3. 인벤토리가 가득 차서 일부만 추가되었거나 못 넣었을 때
    return added


func get_inventory_slots() -> Array:
    return player_inventory_slots


func get_hotbar_slots() -> Array:
    return player_hotbar_slots


func remove_item(item_data: ItemData, amount: int) -> void:
    pass
