extends Control

@export var slot_scene: PackedScene

@onready var grid_container = $InventoryUI/GridContainer
@onready var hotbar_container = $InventoryUI/HotbarContainer


func _ready():
	# 인벤토리 슬롯 생성
	var inv_slots_data = InventoryManager.get_inventory_slots()
	for i in range(inv_slots_data.size()):
		var slot_data = inv_slots_data[i]
		var slot_node = slot_scene.instantiate()
		slot_node.item_data = slot_data.item_data # 이 할당이 slot.gd의 setter를 호출하여 UI 초기화
		slot_node.amount = slot_data.amount     # 이 할당이 slot.gd의 setter를 호출하여 UI 초기화
		slot_node.slot_type = "inventory"
		slot_node.slot_index = i
		slot_node.slot_ui_needs_refresh.connect(_on_slot_ui_refresh_requested) # 신호 연결
		grid_container.add_child(slot_node)

	# 핫바 슬롯 생성
	var hotbar_slots_data = InventoryManager.get_hotbar_slots()
	for i in range(hotbar_slots_data.size()):
		var slot_data = hotbar_slots_data[i]
		var slot_node = slot_scene.instantiate()
		slot_node.item_data = slot_data.item_data # UI 초기화
		slot_node.amount = slot_data.amount     # UI 초기화
		slot_node.slot_type = "hotbar"
		slot_node.slot_index = i
		slot_node.slot_ui_needs_refresh.connect(_on_slot_ui_refresh_requested) # 신호 연결
		hotbar_container.add_child(slot_node)
	
	# 인벤토리 UI를 그룹에 추가 (slot.gd에서 get_tree().get_first_node_in_group("inventory_ui") 사용 시 필요)
	# add_to_group("inventory_ui") # 이 방법 대신 아래 _on_slot_ui_refresh_requested 에서 직접 컨테이너 접근


func _on_slot_ui_refresh_requested(p_slot_type: String, p_slot_index: int):
	var target_ui_container = null
	var slots_data_array = null

	if p_slot_type == "inventory":
		target_ui_container = grid_container
		slots_data_array = InventoryManager.get_inventory_slots()
	elif p_slot_type == "hotbar":
		target_ui_container = hotbar_container
		slots_data_array = InventoryManager.get_hotbar_slots()
	else:
		printerr("Inventory.gd: Unknown slot type for UI refresh - ", p_slot_type)
		return

	if not target_ui_container:
		printerr("Inventory.gd: Target UI container not found for type - ", p_slot_type)
		return
	
	if p_slot_index < 0 or p_slot_index >= target_ui_container.get_child_count():
		printerr("Inventory.gd: Invalid slot UI index for refresh. Type: %s, Index: %d, ChildCount: %d" % [p_slot_type, p_slot_index, target_ui_container.get_child_count()])
		return
		
	var slot_ui_node = target_ui_container.get_child(p_slot_index)

	if not (slot_ui_node is Panel): # Slot.gd가 Panel을 상속한다고 가정
		printerr("Inventory.gd: Slot UI node is not a Panel. Type: %s, Index: %d" % [p_slot_type, p_slot_index])
		return

	if p_slot_index < 0 or p_slot_index >= slots_data_array.size():
		printerr("Inventory.gd: Invalid slot data index for refresh. Type: %s, Index: %d, ArraySize: %d" % [p_slot_type, p_slot_index, slots_data_array.size()])
		return

	var current_slot_data = slots_data_array[p_slot_index]
	
	# slot.gd의 item_data 및 amount setter를 호출하여 UI를 갱신합니다.
	slot_ui_node.item_data = current_slot_data.item_data
	slot_ui_node.amount = current_slot_data.amount


func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().paused = false
		queue_free()
