extends Resource
class_name InventoryData

@export var inventory_slots: Array[SlotData] = []
@export var hotbar_slots: Array[SlotData] = []

@export var inventory_max_size: int = 20
@export var hotbar_max_size: int = 5


func ensure_slots(inv_size := inventory_max_size, hotbar_size := hotbar_max_size):
    inventory_max_size = inv_size
    hotbar_max_size = hotbar_size
    while inventory_slots.size() < inventory_max_size:
        inventory_slots.append(SlotData.new())
    while hotbar_slots.size() < hotbar_max_size:
        hotbar_slots.append(SlotData.new())
    # 필요하다면 줄어든 경우도 처리
    while inventory_slots.size() > inventory_max_size:
        inventory_slots.pop_back()
    while hotbar_slots.size() > hotbar_max_size:
        hotbar_slots.pop_back()