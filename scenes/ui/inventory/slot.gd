extends Panel

signal slot_ui_needs_refresh(slot_type_to_refresh: String, slot_index_to_refresh: int)

@export var item_data: ItemData = null:
	set(value):
		item_data = value

		if value == null:
			$Icon.texture = null
			$Amount.text = ""
			return
		
		$Icon.texture = value.icon

@export var amount: int = 0:
	set(value):
		amount = value
		$Amount.text = str(value)
		if amount <= 0:
			item_data = null


func set_amount(value: int) -> void:
	amount = value


func get_amount(value: int) -> void:
	amount += value


# 아이템 합치기/스택 제한 로직 추가
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if not (data is Dictionary and data.has("item_data") and data.item_data is ItemData):
		return false # 유효하지 않은 드래그 데이터

	# Case 1: 현재 슬롯(타겟)이 비어있으면 어떤 아이템이든 드랍 가능
	if not item_data:
		return true

	# Case 2: 현재 슬롯(타겟)에 아이템이 이미 있는 경우
	#   2a: 부분 드래그(Ctrl/Shift) 시
	if data.has("split") and data.split:
		if item_data.name != data.item_data.name:
			# 다른 종류의 아이템 위에는 부분 드랍 불가
			return false
		else:
			# 같은 종류의 아이템 위에는 부분 드랍 허용 (합치기 시도)
			# max_stack 초과 여부는 _drop_data에서 최종 처리
			return true
	#   2b: 전체 드래그 시
	else:
		# 같은 종류의 아이템이거나 다른 종류의 아이템 모두 허용 (합치기 또는 스왑 시도)
		return true


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	# 대상 슬롯 정보
	var target_type_val = slot_type
	var target_index_val = slot_index
	# 소스 슬롯 정보
	var source_type_val = data.source_slot_type
	var source_index_val = data.source_slot_index

	# InventoryManager에서 배열 참조
	var source_slots_arr = InventoryManager.get_inventory_slots() if source_type_val == "inventory" else InventoryManager.get_hotbar_slots()
	var target_slots_arr = InventoryManager.get_inventory_slots() if target_type_val == "inventory" else InventoryManager.get_hotbar_slots()

	# 인덱스 유효성 검사
	if source_index_val < 0 or source_index_val >= source_slots_arr.size() or \
		target_index_val < 0 or target_index_val >= target_slots_arr.size():
		printerr("Slot.gd: Invalid slot index in _drop_data.")
		return

	var source_slot_data_ref = source_slots_arr[source_index_val]
	var target_slot_data_ref = target_slots_arr[target_index_val]

	var performed_operation = false
	var move_amount = data.amount # data.amount는 드래그 시작 시 결정된 실제 이동량

	# 자기 자신에게 드랍하는 경우는 아무 작업 안 함 (또는 특정 로직)
	if target_slot_data_ref == source_slot_data_ref:
		# performed_operation = true # 드래그 완료로 간주하고 싶다면 true
		# 여기서는 false로 두어 아무 변화 없도록 함 (아이템이 원래 자리로 돌아감)
		# 또는 true로 하고 아래 UI 갱신 및 drag_data 초기화만 수행할 수도 있음
		pass # 명시적으로 아무것도 안 함
	# 합치기 시도: 소스와 타겟에 아이템이 있고, 이름이 같을 때
	elif target_slot_data_ref.item_data and source_slot_data_ref.item_data and \
		target_slot_data_ref.item_data is ItemData and source_slot_data_ref.item_data is ItemData and \
		target_slot_data_ref.item_data.name == source_slot_data_ref.item_data.name: # 'name' 속성이 ItemData에 있다고 가정
		
		# ItemData.gd에 max_stack 변수가 선언되어 있다고 가정하고 직접 접근
		var max_stack = target_slot_data_ref.item_data.max_stack 
		
		var can_add_to_target = max_stack - target_slot_data_ref.amount
		
		if can_add_to_target > 0:
			var actual_amount_to_merge = min(move_amount, can_add_to_target)
			target_slot_data_ref.amount += actual_amount_to_merge
			source_slot_data_ref.amount -= actual_amount_to_merge
			if source_slot_data_ref.amount <= 0:
				source_slot_data_ref.item_data = null
				source_slot_data_ref.amount = 0
			performed_operation = true
		# else: 합칠 공간 없음, performed_operation = false 유지

	# 그 외 경우 (타겟이 비었거나, 다른 아이템이 있거나, 합치기 실패)
	else:
		# (1) 부분 드래그 (Ctrl/Shift) 시
		if data.has("split") and data.split:
			# (1a) 타겟 슬롯이 비어있는 경우: 부분 아이템을 타겟 슬롯에 놓음
			if not target_slot_data_ref.item_data:
				target_slot_data_ref.item_data = source_slot_data_ref.item_data # 아이템 종류 복사
				target_slot_data_ref.amount = move_amount # 이동량만큼 설정
				source_slot_data_ref.amount -= move_amount # 소스에서 이동량만큼 차감
				if source_slot_data_ref.amount <= 0:
					source_slot_data_ref.item_data = null
					source_slot_data_ref.amount = 0
				performed_operation = true
			# (1b) 타겟 슬롯이 비어있지 않고, 다른 종류의 아이템인 경우: **드랍 작업 안 함**
			elif target_slot_data_ref.item_data.name != source_slot_data_ref.item_data.name:
				# performed_operation은 false로 유지됨. 아무 작업도 수행하지 않음.
				# 아이템은 드래그 시작 위치로 돌아감 (Godot 기본 동작).
				pass 
			# (1c) 타겟 슬롯이 비어있지 않고, 같은 종류의 아이템이지만 합치기 실패한 경우 (예: 타겟 스택 꽉 참)
			# 이 경우에도 부분 드래그로 스왑을 하거나 놓는 것은 의미가 없으므로 아무 작업 안 함.
			else: # target_slot_data_ref.item_data.name == source_slot_data_ref.item_data.name
				# performed_operation은 false로 유지됨.
				pass

		# (2) 전체 드래그 시 (split이 false)
		else:
			# 타겟 슬롯이 비어있거나 다른 아이템이 있으면 전체 스왑
			var temp_item = target_slot_data_ref.item_data
			var temp_amount = target_slot_data_ref.amount
			
			target_slot_data_ref.item_data = source_slot_data_ref.item_data
			target_slot_data_ref.amount = source_slot_data_ref.amount # 소스 슬롯의 전체 양
			
			source_slot_data_ref.item_data = temp_item
			source_slot_data_ref.amount = temp_amount
			performed_operation = true

	# UI 갱신 신호 발생
	if performed_operation or target_slot_data_ref == source_slot_data_ref : # 작업이 수행되었거나 자기 자신에게 드랍한 경우 UI 갱신
		emit_signal("slot_ui_needs_refresh", target_type_val, target_index_val)
		if not (source_type_val == target_type_val and source_index_val == target_index_val):
			emit_signal("slot_ui_needs_refresh", source_type_val, source_index_val)

	if performed_operation:
		# 드랍 성공 시 drag_data 초기화
		var inventory_ui_node = get_tree().get_first_node_in_group("inventory_ui")
		if inventory_ui_node and inventory_ui_node.has_meta("drag_data"):
			inventory_ui_node.set_meta("drag_data", null)


var slot_type: String # "inventory" or "hotbar"
var slot_index: int # 슬롯의 인덱스 (인벤토리나 핫바에서의 위치)

func _get_drag_data(_at_position: Vector2) -> Variant:
	if item_data:
		var drag_amount = amount
		if Input.is_key_pressed(KEY_SHIFT) and amount > 1:
			drag_amount = int(amount / 2)
		elif Input.is_key_pressed(KEY_CTRL):
			drag_amount = 1

		var preview = Control.new()
		preview.set_anchors_preset(Control.PRESET_CENTER)
		preview.custom_minimum_size = Vector2(32, 32)
		preview.size = Vector2(32, 32)

		var preview_texture = TextureRect.new()
		preview_texture.texture = item_data.icon
		preview_texture.size = Vector2(32, 32)
		preview_texture.position = Vector2.ZERO
		preview_texture.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		preview.add_child(preview_texture)

		var amount_label = Label.new()
		amount_label.text = str(drag_amount)
		amount_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		amount_label.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
		amount_label.position = Vector2(16, 16)
		amount_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		amount_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
		amount_label.add_theme_color_override("font_color", Color.WHITE)
		amount_label.add_theme_color_override("font_outline_color", Color.BLACK)
		amount_label.add_theme_constant_override("outline_size", 2)
		preview.add_child(amount_label)

		var drag_data = {
			"item_data": item_data,
			"amount": drag_amount,
			"source_slot_type": slot_type,
			"source_slot_index": slot_index,
			"split": drag_amount != amount
		}
		# inventory.gd(Inventory UI의 루트)에 드래그 데이터 저장
		get_tree().get_first_node_in_group("inventory_ui").set_meta("drag_data", drag_data)
		set_drag_preview(preview)
		return drag_data

	return null


func _get_tooltip(_at_position: Vector2):
	if item_data and item_data.description:
		return item_data.description
	
	return ""
