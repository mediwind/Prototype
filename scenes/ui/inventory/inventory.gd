extends Control

@export var slot_scene: PackedScene
@export var collectable_object_scene: PackedScene # CollectableObject 씬 에셋 연결

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
	add_to_group("inventory_ui") # 드래그 데이터 전달용 그룹


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

	if event is InputEventMouseButton and not event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		# 먼저 "drag_data" 메타가 있는지 확인
		if not has_meta("drag_data"):
			# print("Inventory: No drag_data meta found on mouse up.") # 디버깅용
			return # drag_data가 없으면 아무것도 안 함 (빈 슬롯 드래그 등)

		var drag_data_from_meta = get_meta("drag_data")

		# drag_data_from_meta가 null인 경우는 slot.gd에서 이미 처리했거나,
		# 빈 슬롯 드래그 후 _get_drag_data에서 drag_data를 설정하지 않은 경우일 수 있음.
		# 하지만 위에서 has_meta로 걸렀으므로, 이 시점에서 drag_data_from_meta는 null이 아니어야 함.
		# (만약 slot.gd에서 명시적으로 set_meta("drag_data", null)을 했다면 null일 수 있음)
		if drag_data_from_meta == null: # 이중 확인 또는 slot.gd 로직에 따라 필요할 수 있음
			# print("Inventory: drag_data_from_meta was null even after has_meta check (slot.gd might have nulled it).") # 디버깅용
			return

		set_meta("drag_data", null) 

		var current_drag_data = drag_data_from_meta

		if current_drag_data.has("item_data") and current_drag_data.item_data:
			var hovered_control = get_viewport().gui_get_hovered_control()
			var is_drop_on_valid_slot_area = false # 변수명 유지 또는 is_drop_on_slot_node 등으로 변경 가능

			if hovered_control:
				# 현재 마우스 아래 컨트롤이 "inventory_slot" 그룹에 속해 있는지 확인
				if hovered_control.is_in_group("inventory_slot"):
					is_drop_on_valid_slot_area = true
				# 또는, 마우스 아래 컨트롤의 부모가 "inventory_slot" 그룹에 속해 있는지 확인
				elif hovered_control.get_parent() and hovered_control.get_parent().is_in_group("inventory_slot"):
					is_drop_on_valid_slot_area = true
				# 또는, 마우스 아래 컨트롤이 GridContainer나 HotbarContainer 자체인 경우
				elif hovered_control == grid_container or hovered_control == hotbar_container:
					is_drop_on_valid_slot_area = true
				
				# 디버깅 로그 추가
				# print("Hovered: ", hovered_control.name if hovered_control else "None", 
				#       ", Parent: ", parent.name if parent else "None", 
				#       ", Is drop on valid slot area: ", is_drop_on_valid_slot_area)

			if not is_drop_on_valid_slot_area:
				print("Inventory: Dropping to map because NOT is_drop_on_valid_slot_area. Hovered: %s. Data: %s" % [hovered_control.name if hovered_control else "None", current_drag_data])
				
				# 아이템 차감 로직 변경
				var item_removed_successfully = InventoryManager.remove_item_from_slot(
					current_drag_data.item_data, 
					current_drag_data.amount, 
					current_drag_data.source_slot_type, 
					current_drag_data.source_slot_index
				)

				if item_removed_successfully:
					_drop_item_to_map(current_drag_data) # 실제 맵에 드랍 (아이템 차감 성공 시)
					# 원본 슬롯 UI 갱신
					if current_drag_data.has("source_slot_type") and current_drag_data.has("source_slot_index"):
						_on_slot_ui_refresh_requested(current_drag_data.source_slot_type, current_drag_data.source_slot_index)
				else:
					printerr("Inventory: Failed to remove item from source slot. Map drop aborted.")
			else:
				print("Inventory: Drop was on a valid slot area. slot.gd should handle it. Hovered: %s. Data: %s" % [hovered_control.name if hovered_control else "None", current_drag_data])


func _drop_item_to_map(drag_data): # 이제 이 함수는 순수하게 맵에 오브젝트를 생성하는 역할만 함
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		printerr("Player not found for dropping item.")
		return
	var radius = 64.0 
	var angle = randf() * TAU
	var drop_pos = player.global_position + Vector2(cos(angle), sin(angle)) * radius

	if collectable_object_scene == null:
		printerr("CollectableObject scene not set in Inventory.gd")
		return
		
	var obj = collectable_object_scene.instantiate()
	if not obj.has_method("setup_drop"):
		printerr("CollectableObject instance does not have setup_drop method.")
		obj.queue_free() 
		return

	obj.setup_drop(drag_data.item_data, drag_data.amount)
	obj.global_position = drop_pos
	get_tree().current_scene.add_child(obj)
