extends Panel

signal slot_ui_needs_refresh(slot_type_to_refresh: String, slot_index_to_refresh: int)

# 아이콘 및 수량 표시를 위한 노드 (씬 트리에서 직접 할당 권장)
@onready var icon_rect: TextureRect = $Icon
@onready var amount_label: Label = $Amount
@onready var quality_star: TextureRect = $QualityStar

@export var equipment_slot_type: EquipmentData.EquipmentSlotType
# 슬롯 데이터
@export var item_data: ItemData = null: # @export 키워드 추가
	set(value):
		item_data = value
		_update_icon_display()
		# 아이템이 제거되면 품질도 초기화
		if item_data == null:
			quality = 0
@export var amount: int = 0: # @export 키워드 추가
	set(value):
		amount = value
		if amount <= 0 and item_data != null:
			item_data = null # item_data setter가 _update_icon_display 호출
		_update_amount_display()

@export var quality: int = 0:
	set(value):
		quality = value
		_update_quality_display(quality)

# 등급 아이콘 설정 (Sprite Sheet 사용)
const QUALITY_SHEET = preload("res://assets/ui/icons/quality_stars.png")
const STAR_SIZE = 16 # 별 아이콘 하나의 크기 (픽셀)


# 슬롯 타입 및 인덱스 (Inventory.gd에서 설정)
var slot_type: String
var slot_index: int

const GROUP_INVENTORY_UI = "inventory_ui"
const PREVIEW_SIZE = Vector2(32, 32)
const PREVIEW_AMOUNT_OUTLINE_SIZE = 2


func _ready():
	_update_icon_display()
	_update_amount_display()
	_update_quality_display(quality) # 초기화 시 등급 아이콘 표시 보장
	if not is_in_group("inventory_slot"): # 에디터에서 설정 안했을 경우 대비
		add_to_group("inventory_slot")


# 슬롯의 아이콘 표시를 업데이트합니다. item_data에 따라 아이콘을 설정하거나 숨깁니다.
func _update_icon_display():
	if not is_inside_tree(): return
	if not icon_rect: # @onready가 실패했거나 노드가 없을 경우 대비
		printerr("Slot.gd: Icon node not found for slot %s[%d]" % [slot_type, slot_index])
		return

	if item_data and item_data.icon:
		icon_rect.texture = item_data.icon
		icon_rect.visible = true
	else:
		icon_rect.texture = null
		icon_rect.visible = false


# 슬롯의 아이템 수량 표시를 업데이트합니다. amount에 따라 수량을 표시하거나 숨깁니다.
func _update_amount_display():
	if not is_inside_tree(): return
	if not amount_label:
		printerr("Slot.gd: Amount node not found for slot %s[%d]" % [slot_type, slot_index])
		return

	if item_data and amount > 0:
		amount_label.text = str(amount)
		amount_label.visible = true
	else:
		amount_label.text = ""
		amount_label.visible = false


# 이 슬롯에 주어진 드래그 데이터를 드랍할 수 있는지 여부를 결정합니다.
# 부분 드래그 시 다른 아이템 위에는 드랍을 허용하지 않습니다.
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if not _is_valid_drag_data(data):
		return false

	# 1. 장비 슬롯(부위 지정)일 경우: 해당 부위 장비만 허용
	if equipment_slot_type != EquipmentData.EquipmentSlotType.NONE:
		# 아이템이 장비가 아니거나, 장비 부위가 다르면 드랍 불가
		if not data.item_data or not data.item_data.equipment_data:
			return false
		return data.item_data.equipment_data.slot_type == equipment_slot_type

	# 2. 인벤토리/핫바 슬롯(부위 미지정)일 경우: 기존 로직 유지
	if not item_data: # 타겟 슬롯이 비어있으면 항상 가능
		return true

	var is_partial_drag = data.has("split") and data.split
	var dragged_item_name = data.item_data.name

	if is_partial_drag:
		# 부분 드래그 시, 다른 종류의 아이템 위에는 드랍 불가
		return item_data.name == dragged_item_name
	else:
		# 전체 드래그 시, 모든 경우 허용 (합치기 또는 스왑)
		return true


# 드래그 데이터가 유효한 형식인지 (아이템 정보를 포함하는 Dictionary인지) 확인합니다.
func _is_valid_drag_data(data: Variant) -> bool:
	return data is Dictionary and data.has("item_data") and data.item_data is ItemData


# 슬롯에서 아이템을 드래그 시작할 때 호출되며, 드래그에 필요한 데이터와 프리뷰를 설정합니다.
func _get_drag_data(_at_position: Vector2) -> Variant:
	if not item_data or amount <= 0:
		return null

	var drag_amount = _calculate_drag_amount()
	if drag_amount <= 0: return null

	var preview_control = _create_drag_preview_control(item_data, drag_amount)
	set_drag_preview(preview_control)

	var drag_payload = {
		"item_data": item_data,
		"amount": drag_amount,
		"source_slot_type": slot_type,
		"source_slot_index": slot_index,
		"split": drag_amount < amount
	}
	_store_drag_payload_in_inventory_ui(drag_payload)
	return drag_payload


# Ctrl 또는 Shift 키 입력에 따라 드래그할 아이템의 수량을 계산합니다.
func _calculate_drag_amount() -> int:
	var base_amount = amount
	if Input.is_key_pressed(KEY_SHIFT) and base_amount > 1:
		return int(base_amount / 2.0)
	elif Input.is_key_pressed(KEY_CTRL) and base_amount > 0:
		return 1
	return base_amount


# 드래그 시 마우스 커서에 표시될 프리뷰 컨트롤(아이콘과 수량)을 생성합니다.
func _create_drag_preview_control(p_item_data: ItemData, p_drag_amount: int) -> Control:
	var preview = Control.new()
	preview.custom_minimum_size = PREVIEW_SIZE
	preview.size = PREVIEW_SIZE

	var texture_rect = TextureRect.new()
	texture_rect.texture = p_item_data.icon
	texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	texture_rect.size = PREVIEW_SIZE
	preview.add_child(texture_rect)

	if p_drag_amount > 0: # 0개면 표시 안함 (또는 1개일때도 안하게 하려면 >1)
		var label = Label.new()
		label.text = str(p_drag_amount)
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		label.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
		label.add_theme_font_size_override("font_size", 14)
		label.add_theme_color_override("font_color", Color.WHITE)
		label.add_theme_color_override("font_outline_color", Color.BLACK)
		label.add_theme_constant_override("outline_size", PREVIEW_AMOUNT_OUTLINE_SIZE)
		label.set_anchors_preset(Control.PRESET_FULL_RECT)
		preview.add_child(label)
	return preview


# 드래그 시작 시 생성된 드래그 페이로드를 Inventory UI 노드의 메타데이터에 저장합니다.
# 이는 UI 외부로 드랍 시 Inventory.gd에서 접근하기 위함입니다.
func _store_drag_payload_in_inventory_ui(payload: Dictionary):
	var inventory_ui_node = get_tree().get_first_node_in_group(GROUP_INVENTORY_UI)
	if inventory_ui_node:
		inventory_ui_node.set_meta("drag_data", payload)
	else:
		printerr("Slot.gd: Inventory UI node not found to store drag_data.")


# 이 슬롯에 아이템이 드랍되었을 때 호출됩니다. 아이템 합치기, 놓기 또는 스왑을 처리합니다.
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var source_type: String = data.source_slot_type
	var source_idx: int = data.source_slot_index
	var dragged_item_data: ItemData = data.item_data
	var dragged_amount: int = data.amount
	var is_partial_drag: bool = data.split

	var source_slot_ref: Object = _get_slot_data_reference_from_manager(source_type, source_idx) # 타입 명시 Object
	var target_slot_ref: Object = _get_slot_data_reference_from_manager(slot_type, slot_index) # 타입 명시 Object

	if not source_slot_ref or not target_slot_ref:
		_clear_drag_payload_from_inventory_ui()
		return

	var operation_performed = false

	if target_slot_ref == source_slot_ref:
		pass
	elif _try_merge_items(source_slot_ref, target_slot_ref, dragged_item_data, dragged_amount): # source_slot_ref, target_slot_ref는 Object
		operation_performed = true
	elif _try_place_or_swap_items(source_slot_ref, target_slot_ref, dragged_item_data, dragged_amount, is_partial_drag): # source_slot_ref, target_slot_ref는 Object
		operation_performed = true

	_finalize_drop_operation(operation_performed, source_type, source_idx)


# InventoryManager로부터 특정 타입과 인덱스에 해당하는 슬롯의 데이터 참조(Object)를 가져옵니다.
func _get_slot_data_reference_from_manager(p_slot_type: String, p_slot_idx: int) -> Variant:
	var slots_array: Array
	if p_slot_type == "inventory":
		slots_array = InventoryManager.get_inventory_slots()
	elif p_slot_type == "hotbar":
		slots_array = InventoryManager.get_hotbar_slots()
	elif p_slot_type == "equipment":
		slots_array = InventoryManager.get_equipment_slots()
	else:
		printerr("Slot.gd: Unknown slot type '%s'." % p_slot_type)
		return null

	if p_slot_idx < 0 or p_slot_idx >= slots_array.size():
		printerr("Slot.gd: Invalid slot index %d for type '%s'." % [p_slot_idx, p_slot_type])
		return null
	return slots_array[p_slot_idx] # 이 반환값은 Object (InventoryManager의 슬롯 객체)


# 드래그된 아이템을 타겟 슬롯의 아이템과 합치기를 시도합니다.
# 같은 종류의 아이템이고, 타겟 슬롯에 공간이 있어야 성공합니다.
func _try_merge_items(source_slot: Object, target_slot: Object, dragged_item: ItemData, p_dragged_amount: int) -> bool:
	# Object의 item_data 속성이 null이 아니고, 그 타입이 ItemData인지 확인
	# 그리고 source_slot의 item_data도 null이 아닌지 확인
	if not (target_slot.item_data != null and target_slot.item_data is ItemData and \
			source_slot.item_data != null and source_slot.item_data is ItemData and \
			target_slot.item_data.name == dragged_item.name):
		return false
	
	# 등급 체크: 다르면 합치기 불가
	if target_slot.quality != source_slot.quality:
		return false

	# ItemData 리소스에 max_stack 속성이 있다고 가정
	var max_stack = target_slot.item_data.max_stack
	var space_in_target = max_stack - target_slot.amount
	if space_in_target <= 0: return false

	var amount_to_move = min(p_dragged_amount, space_in_target)

	target_slot.amount += amount_to_move
	source_slot.amount -= amount_to_move

	if source_slot.amount <= 0:
		source_slot.item_data = null
		source_slot.amount = 0
		source_slot.quality = 0
	return true


# 드래그된 아이템을 타겟 슬롯에 놓거나, 타겟 슬롯의 아이템과 스왑을 시도합니다.
# 부분 드래그 시에는 빈 슬롯에만 놓을 수 있고, 전체 드래그 시에는 스왑이 가능합니다.
func _try_place_or_swap_items(source_slot: Object, target_slot: Object, dragged_item: ItemData, p_dragged_amount: int, is_partial: bool) -> bool:
	if is_partial:
		# 타겟 슬롯이 비어있거나 (item_data가 null), 아이템이 없는 경우 (amount가 0)
		if not target_slot.item_data:
			target_slot.item_data = dragged_item
			target_slot.amount = p_dragged_amount
			target_slot.quality = source_slot.quality # 부분 이동 시 품질 복사
			
			source_slot.amount -= p_dragged_amount
			if source_slot.amount <= 0:
				source_slot.item_data = null; source_slot.amount = 0; source_slot.quality = 0 # 소스 비우기
			return true
		return false
	else: # 전체 드래그
		var temp_item = target_slot.item_data
		var temp_amount = target_slot.amount
		var temp_quality = target_slot.quality # 품질도 스왑 대상
		
		target_slot.item_data = source_slot.item_data
		target_slot.amount = source_slot.amount # 전체 드래그이므로 소스 슬롯의 현재 양을 그대로 가져옴
		target_slot.quality = source_slot.quality
		
		source_slot.item_data = temp_item
		source_slot.amount = temp_amount
		source_slot.quality = temp_quality
		return true


# 드랍 작업(합치기, 놓기, 스왑)의 성공 여부에 따라 UI 갱신 신호를 보내고,
# Inventory UI에 저장된 드래그 페이로드를 정리합니다.
func _finalize_drop_operation(was_successful: bool, src_type: String, src_idx: int):
    # 자기 자신에게 드랍했거나, 실제 작업이 성공한 경우 UI 갱신 필요
	var needs_ui_refresh_for_target = (slot_type == src_type and slot_index == src_idx) or was_successful
	var needs_ui_refresh_for_source = was_successful and not (src_type == slot_type and src_idx == slot_index)

	if needs_ui_refresh_for_target:
		emit_signal("slot_ui_needs_refresh", slot_type, slot_index)
	if needs_ui_refresh_for_source:
		emit_signal("slot_ui_needs_refresh", src_type, src_idx)

	# 실제 작업이 성공했거나, 자기 자신에게 드랍하여 드래그를 끝내는 경우 drag_data 초기화
	if was_successful or (slot_type == src_type and slot_index == src_idx):
		_clear_drag_payload_from_inventory_ui()
	
	StatManager.recalculate_player_stats()


# Inventory UI 노드에 저장된 드래그 페이로드 메타데이터를 제거(null로 설정)합니다.
func _clear_drag_payload_from_inventory_ui():
	var inventory_ui_node = get_tree().get_first_node_in_group(GROUP_INVENTORY_UI)
	if inventory_ui_node and inventory_ui_node.has_meta("drag_data"):
		inventory_ui_node.set_meta("drag_data", null)


# 슬롯에 마우스를 올렸을 때 표시될 툴팁 문자열을 반환합니다. 아이템 설명을 사용합니다.
func _get_tooltip(_at_position: Vector2) -> String:
	if item_data: # item_data가 null이 아닌지 먼저 확인
		# ItemData에 get_description() 메서드가 있다면 우선 사용 (선택적)
		if item_data.has_method("get_description"):
			var desc_from_method = item_data.get_description()
			# 메서드가 실제 문자열을 반환하고 비어있지 않은지 확인
			if desc_from_method is String and not desc_from_method.is_empty():
				return desc_from_method
		
		# 그렇지 않다면 description 속성을 직접 사용
		# ItemData.gd에 @export var description: String 으로 선언되어 있으므로 속성은 항상 존재함
		# 내용이 있는지 (빈 문자열이 아닌지) 확인
		if not item_data.description.is_empty():
			return item_data.description
			
	return "" # item_data가 없거나, description이 비어있으면 빈 툴팁 반환

# 외부에서 슬롯 데이터를 한 번에 설정할 때 사용 (로드 시 등)
func set_slot_data(slot_data: SlotData) -> void:
	if slot_data and slot_data.item_data:
		item_data = slot_data.item_data
		amount = slot_data.amount
		quality = slot_data.quality # quality setter가 _update_quality_display 호출
	else:
		item_data = null
		amount = 0
		quality = 0


func _update_quality_display(quality: int = 0):
	if not quality_star:
		# print("Slot: QualityStar node missing!")
		return
	
	if quality <= 0:
		quality_star.texture = null
		quality_star.visible = false
		return
		
	# AtlasTexture를 즉석에서 생성해서 사용
	var atlas = AtlasTexture.new()
	atlas.atlas = QUALITY_SHEET
	
	# 스프라이트 시트 순서: 은(1) -> 금(2) -> 보라(3) 가정
	# 인덱스: 0, 1, 2...
	var index = quality - 1
	if index < 0: index = 0
	
	atlas.region = Rect2(index * STAR_SIZE, 0, STAR_SIZE, STAR_SIZE)
	quality_star.texture = atlas
	
	# DEBUG: Pink Square Test
	# var debug_tex = PlaceholderTexture2D.new()
	# debug_tex.size = Vector2(16, 16)
	# quality_star.texture = debug_tex
	
	quality_star.visible = true
	
	# Debug: Texture size check
	# print("Slot: Star Region: ", atlas.region)
