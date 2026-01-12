extends Control

@export var slot_scene: PackedScene
@export var collectable_object_scene: PackedScene

@onready var grid_container: GridContainer = $CanvasLayer/GridContainer
@onready var hotbar_container: HBoxContainer = $CanvasLayer/HotbarContainer
@onready var equipment_ui: Control = $CanvasLayer/EquipmentUI

const GROUP_INVENTORY_UI = "inventory_ui"
const GROUP_INVENTORY_SLOT = "inventory_slot"
const GROUP_PLAYER = "player"
const DEFAULT_DROP_RADIUS = 64.0


func _ready():
	_initialize_slots_ui()
	_add_self_to_inventory_ui_group()


# 인벤토리 UI 초기화 시 호출되어, 인벤토리 및 핫바 슬롯 UI를 생성하고 설정합니다.
func _initialize_slots_ui():
	# 인벤토리 및 핫바 슬롯 동적 생성 및 설정
	if slot_scene:
		if grid_container:
			_create_slots_for_type("inventory", InventoryManager.get_inventory_slots(), grid_container)
		if hotbar_container:
			_create_slots_for_type("hotbar", InventoryManager.get_hotbar_slots(), hotbar_container)
	else:
		printerr("Inventory.gd: Slot scene is not assigned. Inventory/Hotbar slots will not be created dynamically.")

	# 장비 UI 슬롯 초기화 (시그널 연결 등)
	_initialize_equipment_slots_ui()


# 장비 UI의 각 슬롯에 대해 시그널을 연결하고 기본값을 설정합니다.
func _initialize_equipment_slots_ui():
	if not equipment_ui:
		printerr("Inventory.gd: EquipmentUI node is not assigned in InventoryUI.")
		return

	# equipment_ui.gd 에서 이미 slot_nodes 배열 순서대로 slot_index와 slot_type을 설정하고 있음.
	# 해당 순서와 이름을 기반으로 각 슬롯 노드를 가져와 시그널을 연결합니다.
	var equipment_slot_node_names = ["Head", "RightHand", "LeftHand", "Body", "Gloves", "Boots", "Accessory", "Accessory2", "Accessory3"]

	# equipment_ui.gd의 _ready -> sync_equipment_slots_from_data가 먼저 호출되어
	# 각 장비 슬롯의 item_data, amount, slot_index, slot_type이 설정되었다고 가정합니다.
	# 여기서는 시그널만 연결합니다.

	for i in range(equipment_slot_node_names.size()):
		var node_name = equipment_slot_node_names[i]
		var slot_node = equipment_ui.get_node_or_null(node_name)

		if not slot_node:
			printerr("Inventory.gd: Equipment slot node '%s' not found in EquipmentUI." % node_name)
			continue
		
		if not (slot_node is Panel and slot_node.has_method("_update_icon_display")):
			printerr("Inventory.gd: Node '%s' in EquipmentUI is not a valid Slot Panel." % node_name)
			continue
		
		# slot_node.slot_index는 equipment_ui.gd에서 이미 i로 설정되었을 것입니다.
		# slot_node.slot_type은 equipment_ui.gd에서 이미 "equipment"로 설정되었을 것입니다.
		_connect_slot_refresh_signal(slot_node, "equipment", i) # i는 여기서 루프 인덱스이자, 해당 슬롯의 기대 인덱스


# 지정된 타입(인벤토리/핫바)의 슬롯들을 데이터에 맞게 생성하여 컨테이너에 추가합니다.
func _create_slots_for_type(p_slot_type: String, p_slots_data_array: Array, p_container: Container):
	if not p_container:
		printerr("Inventory.gd: Container for '%s' is null." % p_slot_type)
		return

	for i in range(p_slots_data_array.size()):
		var slot_data_object = p_slots_data_array[i]
		var new_slot_node = slot_scene.instantiate()

		if not _configure_and_add_slot(new_slot_node, slot_data_object, p_slot_type, i, p_container):
			new_slot_node.queue_free()


# 개별 슬롯 노드를 설정하고 컨테이너에 자식으로 추가합니다. 슬롯 데이터와 UI를 연결합니다.
func _configure_and_add_slot(slot_node: Panel, p_slot_data_obj: Object, p_type: String, p_idx: int, p_cont: Container) -> bool:
	if not (slot_node is Panel and slot_node.has_method("_update_icon_display")):
		printerr("Inventory.gd: Instantiated slot for '%s[%d]' is not a valid Slot Panel." % [p_type, p_idx])
		return false

	if p_slot_data_obj:
		if "item_data" in p_slot_data_obj and "amount" in p_slot_data_obj:
			slot_node.set_slot_data(p_slot_data_obj)
		else:
			printerr("Inventory.gd: Slot data object for '%s[%d]' is missing 'item_data' or 'amount' properties." % [p_type, p_idx])
			slot_node.item_data = null
			slot_node.amount = 0
	else:
		printerr("Inventory.gd: Received null slot data object for '%s[%d]'." % [p_type, p_idx])
		slot_node.item_data = null
		slot_node.amount = 0

	slot_node.slot_type = p_type
	slot_node.slot_index = p_idx
	
	if p_slot_data_obj:
		print("InvUI_Init: Created slot %s[%d] -> Q: %d" % [p_type, p_idx, p_slot_data_obj.quality])

	_connect_slot_refresh_signal(slot_node, p_type, p_idx)
	p_cont.add_child(slot_node)
	return true


# 슬롯 노드의 'slot_ui_needs_refresh' 시그널을 이 인벤토리의 핸들러 메서드에 연결합니다.
func _connect_slot_refresh_signal(slot_node: Panel, type_for_err: String, idx_for_err: int):
	var signal_name = "slot_ui_needs_refresh"
	var callable_method = Callable(self, "_on_slot_ui_refresh_requested")
	if not slot_node.is_connected(signal_name, callable_method):
		var err = slot_node.connect(signal_name, callable_method)
		if err != OK:
			printerr("Inventory.gd: Failed to connect '%s' for %s[%d]. Error: %s" % [signal_name, type_for_err, idx_for_err, err])


# 이 인벤토리 UI 노드를 'inventory_ui' 그룹에 추가하여 다른 노드에서 쉽게 참조할 수 있도록 합니다.
func _add_self_to_inventory_ui_group():
	if not is_in_group(GROUP_INVENTORY_UI):
		add_to_group(GROUP_INVENTORY_UI)


# 'slot_ui_needs_refresh' 시그널을 받았을 때 호출되어, 해당 슬롯의 UI 표시를 업데이트합니다.
func _on_slot_ui_refresh_requested(p_slot_type: String, p_slot_index: int):
	var ui_container = _get_ui_container_by_type(p_slot_type)
	var data_array = _get_data_array_by_type(p_slot_type)

	if not ui_container or not data_array:
		return

	if p_slot_type == "equipment":
		# EquipmentUI의 자식 슬롯 노드 직접 접근
		var slot_nodes = [
			ui_container.get_node("Head"),
			ui_container.get_node("RightHand"),
			ui_container.get_node("LeftHand"),
			ui_container.get_node("Body"),
			ui_container.get_node("Gloves"),
			ui_container.get_node("Boots"),
			ui_container.get_node("Accessory"),
			ui_container.get_node("Accessory2"),
			ui_container.get_node("Accessory3")
		]
		if p_slot_index < 0 or p_slot_index >= slot_nodes.size():
			printerr("Inventory.gd: Invalid equipment slot index %d." % p_slot_index)
			return
		var slot_node_to_update = slot_nodes[p_slot_index]
		var current_data = data_array[p_slot_index]
		slot_node_to_update.set_slot_data(current_data)
		return

	# 기존 인벤토리/핫바 처리
	if not _is_valid_index_for_refresh(p_slot_index, ui_container, data_array):
		return

	var slot_node_to_update = ui_container.get_child(p_slot_index)
	if not (slot_node_to_update is Panel):
		printerr("Inventory.gd: Node at %s[%d] is not a Panel for UI refresh." % [p_slot_type, p_slot_index])
		return

	var current_data = data_array[p_slot_index]
	print("InvUI [%s:%d]: Passing data -> Amount: %d, Q: %d" % [p_slot_type, p_slot_index, current_data.amount, current_data.quality])
	slot_node_to_update.set_slot_data(current_data)


# 슬롯 타입 문자열에 따라 해당하는 UI 컨테이너 노드를 반환합니다.
func _get_ui_container_by_type(type_str: String) -> Container:
	if type_str == "inventory":
		return grid_container
	if type_str == "hotbar":
		return hotbar_container
	if type_str == "equipment":
		return equipment_ui # EquipmentUI 노드 반환
	printerr("Inventory.gd: Unknown slot type '%s' for UI container." % type_str)
	return null


# 슬롯 타입 문자열에 따라 InventoryManager로부터 해당하는 슬롯 데이터 배열을 가져옵니다.
func _get_data_array_by_type(type_str: String) -> Array:
	if type_str == "inventory":
		return InventoryManager.get_inventory_slots()
	if type_str == "hotbar":
		return InventoryManager.get_hotbar_slots()
	if type_str == "equipment":
		return InventoryManager.get_equipment_slots()
	printerr("Inventory.gd: Unknown slot type '%s' for data array." % type_str)
	return []


# UI 새로고침을 위한 인덱스가 유효한 범위 내에 있는지 확인합니다.
func _is_valid_index_for_refresh(idx: int, ui_cont: Container, data_arr: Array) -> bool:
	if idx < 0 or idx >= ui_cont.get_child_count():
		printerr("Inventory.gd: Invalid UI index %d (max %d)." % [idx, ui_cont.get_child_count() - 1])
		return false
	if idx < 0 or idx >= data_arr.size():
		printerr("Inventory.gd: Invalid data index %d (max %d)." % [idx, data_arr.size() - 1])
		return false
	return true


func _input(event: InputEvent):
	if _is_escape_key_pressed(event):
		_handle_escape_action()
	elif _is_left_mouse_button_released(event):
		_handle_item_drop_action()


func _is_escape_key_pressed(event: InputEvent) -> bool:
	return event is InputEventKey and event.keycode == KEY_ESCAPE and event.is_pressed() and not event.is_echo()


func _is_left_mouse_button_released(event: InputEvent) -> bool:
	return event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.is_pressed()


func _handle_escape_action():
	if get_tree(): get_tree().paused = false
	queue_free()


func _handle_item_drop_action():
	if not has_meta("drag_data"): return

	var drag_payload = get_meta("drag_data")
	# 드래그 데이터는 slot.gd의 _finalize_drop_operation 또는 여기서 처리 후 null로 설정됨.
	# 여기서 set_meta("drag_data", null)을 호출하면 slot.gd의 로직과 충돌 가능성 있음.
	# slot.gd에서 드래그 완료 시 확실히 null로 만들도록 하고, 여기서는 가져오기만 함.
	# 만약 slot.gd에서 처리가 안된 경우(예: 맵 드랍)를 대비해 여기서도 null로 할 수 있지만,
	# 현재 slot.gd의 _finalize_drop_operation에서 처리하므로 여기서는 생략.

	if drag_payload == null: return # 이미 다른 곳에서 처리됨
	if not (drag_payload is Dictionary and drag_payload.has("item_data")):
		printerr("Inventory.gd: Invalid drag payload.")
		set_meta("drag_data", null) # 잘못된 데이터면 확실히 정리
		return

	var hovered_control = get_viewport().gui_get_hovered_control()
	
	if not _is_drop_on_valid_inventory_ui(hovered_control):
		_process_map_drop(drag_payload)
		set_meta("drag_data", null) # 맵 드랍 후에는 여기서 drag_data 정리
	# else: 유효한 UI 영역 드랍은 slot.gd가 처리. drag_data도 slot.gd가 정리.


func _is_drop_on_valid_inventory_ui(control: Control) -> bool:
	if not control: return false
	if control.is_in_group(GROUP_INVENTORY_SLOT): return true
	var parent = control.get_parent()
	if parent and parent.is_in_group(GROUP_INVENTORY_SLOT): return true
	return control == grid_container or control == hotbar_container


func _process_map_drop(payload: Dictionary):
	var item_removed = InventoryManager.remove_item_from_slot(
		payload.item_data, payload.amount,
		payload.source_slot_type, payload.source_slot_index
	)
	if item_removed:
		_spawn_collectable_on_map(payload)
		_request_ui_refresh_for_source_slot(payload)
	else:
		printerr("Inventory.gd: Failed to remove item for map drop. Payload: ", payload)


func _spawn_collectable_on_map(item_data_to_spawn: Dictionary):
	var player = get_tree().get_first_node_in_group(GROUP_PLAYER)
	if not player:
		printerr("Inventory.gd: Player not found for map drop position.")
		return
	
	var drop_pos = _calculate_drop_position(player.global_position)

	if not collectable_object_scene:
		printerr("Inventory.gd: CollectableObject scene not set.")
		return
		
	var obj = collectable_object_scene.instantiate()
	if not (obj is Node2D and obj.has_method("setup_drop")):
		printerr("Inventory.gd: CollectableObject is invalid or missing 'setup_drop'.")
		obj.queue_free()
		return

	obj.setup_drop(item_data_to_spawn.item_data, item_data_to_spawn.amount)
	obj.global_position = drop_pos
	
	var current_scene_node = get_tree().current_scene
	if current_scene_node:
		current_scene_node.add_child(obj)
	else:
		printerr("Inventory.gd: Current scene not found to add collectable.")


func _calculate_drop_position(base_pos: Vector2) -> Vector2:
	var angle = randf_range(0, TAU)
	var offset = Vector2(cos(angle), sin(angle)) * DEFAULT_DROP_RADIUS
	return base_pos + offset


func _request_ui_refresh_for_source_slot(payload_with_source: Dictionary):
	if payload_with_source.has("source_slot_type") and payload_with_source.has("source_slot_index"):
		_on_slot_ui_refresh_requested(
			payload_with_source.source_slot_type,
			payload_with_source.source_slot_index
		)
