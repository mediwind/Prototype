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


func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if "item_data" in data:
		return is_instance_of(data.item_data, ItemData)
	return false


func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var temp = item_data
	item_data = data.item_data
	data.item_data = temp

	temp = amount
	amount = data.amount
	data.amount = temp


func _get_drag_data(_at_position: Vector2) -> Variant:
	if item_data:
		var preview_texture = TextureRect.new()

		preview_texture.texture = item_data.icon
		preview_texture.size = Vector2(32, 32)
		preview_texture.position = -Vector2(16, 16)

		var preview = Control.new()
		preview.add_child(preview_texture)
		set_drag_preview(preview)

	return self
