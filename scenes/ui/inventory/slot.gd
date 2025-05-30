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
	if "item_data" in data and data.item_data:
        # 빈 슬롯이면 어떤 아이템이든 허용
		if not item_data:
			return true
        # 같은 종류의 아이템이고, 합쳤을 때 max_stack 이하일 때만 허용
		if item_data.name == data.item_data.name:
			return true
        # 다른 종류의 아이템이면 스왑 허용
		return true
	return false


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

	# 합치기/스왑 로직 (SlotData끼리 직접 swap/합치기)
	if target_slot_data_ref.item_data and source_slot_data_ref.item_data and \
		target_slot_data_ref.item_data.name == source_slot_data_ref.item_data.name and \
		target_slot_data_ref != source_slot_data_ref: # 자기 자신에게 합치기 방지
		var max_stack = target_slot_data_ref.item_data.max_stack if "max_stack" in target_slot_data_ref.item_data else 99
		var total = target_slot_data_ref.amount + source_slot_data_ref.amount
		if total <= max_stack:
			target_slot_data_ref.amount = total
			source_slot_data_ref.item_data = null
			source_slot_data_ref.amount = 0
		else:
			target_slot_data_ref.amount = max_stack
			source_slot_data_ref.amount = total - max_stack
		performed_operation = true
	# 그 외에는 SlotData swap (자기 자신에게 드랍하는 경우는 제외)
	elif target_slot_data_ref != source_slot_data_ref:
		var temp_item = target_slot_data_ref.item_data
		var temp_amount = target_slot_data_ref.amount
		target_slot_data_ref.item_data = source_slot_data_ref.item_data
		target_slot_data_ref.amount = source_slot_data_ref.amount
		source_slot_data_ref.item_data = temp_item
		source_slot_data_ref.amount = temp_amount
		performed_operation = true

	# UI 갱신 신호 발생
	# 대상 슬롯 UI 갱신 요청
	emit_signal("slot_ui_needs_refresh", target_type_val, target_index_val)
	# 소스 슬롯 UI 갱신 요청 (소스와 타겟이 다른 경우에만)
	if not (source_type_val == target_type_val and source_index_val == target_index_val):
		emit_signal("slot_ui_needs_refresh", source_type_val, source_index_val)


var slot_type: String # "inventory" or "hotbar"
var slot_index: int # 슬롯의 인덱스 (인벤토리나 핫바에서의 위치)

func _get_drag_data(_at_position: Vector2) -> Variant:
	if item_data:
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

		# 수량 표시용 Label 추가
		var amount_label = Label.new()
		amount_label.text = str(amount)
		amount_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		amount_label.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
		amount_label.position = Vector2(16, 16)
		amount_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		amount_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
		amount_label.add_theme_color_override("font_color", Color.WHITE)
		amount_label.add_theme_color_override("font_outline_color", Color.BLACK)
		amount_label.add_theme_constant_override("outline_size", 2)
		preview.add_child(amount_label)

		set_drag_preview(preview)
		return {
			"item_data": item_data,
			"amount": amount,
			"source_slot_type": slot_type,
			"source_slot_index": slot_index
		}

	return null


func _get_tooltip(_at_position: Vector2):
	if item_data and item_data.description:
		return item_data.description
	
	return ""