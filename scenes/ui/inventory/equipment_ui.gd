extends Control

@onready var slot_nodes := [
    $Head, $RightHand, $LeftHand, $Body, $Gloves, $Boots,  $Accessory, $Accessory2, $Accessory3
]


func _ready():
    sync_equipment_slots_from_data()


func sync_equipment_slots_from_data():
    var data_slots = InventoryManager.get_equipment_slots()
    for i in range(slot_nodes.size()):
        slot_nodes[i].item_data = data_slots[i].item_data
        slot_nodes[i].amount = data_slots[i].amount
        slot_nodes[i].slot_index = i
        slot_nodes[i].slot_type = "equipment"
