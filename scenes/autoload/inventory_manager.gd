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


func remove_item_from_slot(item_data_to_remove: ItemData, amount_to_remove: int, source_slot_type: String, source_slot_index: int) -> bool:
    var target_slots_array = null
    if source_slot_type == "inventory":
        target_slots_array = player_inventory_slots
    elif source_slot_type == "hotbar":
        target_slots_array = player_hotbar_slots
    else:
        printerr("InventoryManager: Unknown slot type for remove_item_from_slot - ", source_slot_type)
        return false

    if source_slot_index < 0 or source_slot_index >= target_slots_array.size():
        printerr("InventoryManager: Invalid slot index for remove_item_from_slot. Type: %s, Index: %d" % [source_slot_type, source_slot_index])
        return false

    var slot_data = target_slots_array[source_slot_index]

    if slot_data.item_data and slot_data.item_data.name == item_data_to_remove.name:
        if slot_data.amount >= amount_to_remove:
            slot_data.amount -= amount_to_remove
            if slot_data.amount <= 0:
                slot_data.item_data = null
                slot_data.amount = 0 # 확실하게 0으로 설정
            return true # 성공적으로 제거
        else:
            # 요청된 양보다 슬롯에 적게 들어있는 경우 (이런 경우는 드래그 로직상 발생하면 안 됨)
            printerr("InventoryManager: Attempted to remove more items than available in slot. Slot: %s[%d], Has: %d, Tried: %d" % [source_slot_type, source_slot_index, slot_data.amount, amount_to_remove])
            # 일단 있는 만큼 모두 제거
            slot_data.item_data = null
            slot_data.amount = 0
            return true # 일부라도 제거는 했음 (혹은 실패로 처리할 수도 있음)
    else:
        # 슬롯에 아이템이 없거나 다른 아이템인 경우
        printerr("InventoryManager: Item not found or mismatch in specified slot for removal. Slot: %s[%d]" % [source_slot_type, source_slot_index])
        return false
