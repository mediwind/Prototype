extends Panel

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
	if "item_data" in data and data.item_data and item_data:
        # 같은 아이템이면 합치기
		if item_data.name == data.item_data.name:
			var max_stack = item_data.max_stack if "max_stack" in item_data else 99
			var total = amount + data.amount
			if total <= max_stack:
				amount = total
				data.amount = 0
				data.item_data = null
			else:
				amount = max_stack
				# 초과분은 드래그 원본 슬롯(data)에 남김
				data.amount = total - max_stack
			return
    # 그 외에는 기존처럼 위치 스왑
	var temp_item = item_data
	item_data = data.item_data
	data.item_data = temp_item

	var temp_amount = amount
	amount = data.amount
	data.amount = temp_amount


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

	return self


func _get_tooltip(_at_position: Vector2):
	if item_data and item_data.description:
		return item_data.description
	
	return ""