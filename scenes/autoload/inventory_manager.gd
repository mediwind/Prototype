extends Node

var player_items: Array = []


func _ready():
    # 누락 시 자동 생성
    if SaveManager.game_data.inventory_data == null:
        SaveManager.game_data.inventory_data = InventoryData.new()
    SaveManager.game_data.inventory_data.ensure_slots()
    player_items = SaveManager.game_data.inventory_data.slots


func add_item(item_data: ItemData, amount: int) -> int:
    var remaining = amount
    var max_stack = item_data.max_stack if "max_stack" in item_data else 99
    var added = 0

    # 1. 이미 같은 아이템이 있는 슬롯에 합치기
    for slot in player_items:
        if slot.item_data and slot.item_data.name == item_data.name:
            var can_add = max_stack - slot.amount
            if can_add > 0:
                var to_add = min(remaining, can_add)
                slot.amount += to_add
                remaining -= to_add
                added += to_add
                if remaining <= 0:
                    return added

    # 2. 빈 슬롯에 새로 추가
    for slot in player_items:
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


func remove_item(item_data: ItemData, amount: int) -> void:
    pass


func get_items() -> Array:
    return player_items