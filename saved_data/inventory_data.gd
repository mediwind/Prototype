extends Resource
class_name InventoryData

@export var slots: Array = []


func ensure_slots():
    if slots.size() == 0: # 이 조건문이 없으면 매번 슬롯이 20개씩 추가됨
        for i in range(20):
            var slot = SlotData.new()
            slots.append(slot)