extends Resource
class_name InventoryData

@export var inventory_slots: Array[SlotData] = []
@export var hotbar_slots: Array[SlotData] = []

@export var equipment_slots: Array[SlotData] = []
@export var equipment_slot_count: int = 9

@export var inventory_max_size: int = 20
@export var hotbar_max_size: int = 5


func ensure_slots(inv_size := inventory_max_size, hotbar_size := hotbar_max_size, equip_size := equipment_slot_count):
    inventory_max_size = inv_size
    hotbar_max_size = hotbar_size
    equipment_slot_count = equip_size

    while inventory_slots.size() < inventory_max_size:
        inventory_slots.append(SlotData.new())
    while hotbar_slots.size() < hotbar_max_size:
        hotbar_slots.append(SlotData.new())
    while equipment_slots.size() < equipment_slot_count:
        equipment_slots.append(SlotData.new())

    # 필요하다면 줄어든 경우도 처리
    while inventory_slots.size() > inventory_max_size:
        inventory_slots.pop_back()
    while hotbar_slots.size() > hotbar_max_size:
        hotbar_slots.pop_back()
    while equipment_slots.size() > equipment_slot_count:
        equipment_slots.pop_back()


func restore_item_references() -> void:
    for slot in inventory_slots:
        slot.try_load_item_from_id()
    for slot in hotbar_slots:
        slot.try_load_item_from_id()
    for slot in equipment_slots:
        slot.try_load_item_from_id()

func prepare_serialization() -> void:
    for slot in inventory_slots:
        if slot.item_data:
            slot.saved_item_id = slot.item_data.id
        else:
            slot.saved_item_id = ""
            
    for slot in hotbar_slots:
        if slot.item_data:
            slot.saved_item_id = slot.item_data.id
        else:
            slot.saved_item_id = ""
            
    for slot in equipment_slots:
        if slot.item_data:
            slot.saved_item_id = slot.item_data.id
        else:
            slot.saved_item_id = ""