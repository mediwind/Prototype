extends Node2D

@export var item_data: ItemData
@export var amount: int = 1
@export var quality: int = 0

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var sprite = $Sprite2D

var _is_collecting := false # 중복 습득 방지 플래그
var original_scale := Vector2.ONE # 아이템마다 다른 원본 스케일 저장


func _ready():
	area_2d.area_entered.connect(_on_area_entered)
	sprite.texture = item_data.icon if item_data else null
	original_scale = sprite.scale # PNG마다 다를 수 있으니 동적으로 저장
	# TODO: 품질에 따른 비주얼 효과(반짝임 등) 추가 가능


func disable_collision():
	collision_shape_2d.disabled = true


func _on_area_entered(_other_area):
	if _is_collecting:
		return

	# 1. 인벤토리에 공간이 있는지 미리 체크
	# 동일 아이템 & 동일 등급 스택 가능 여부 확인 + 빈 슬롯 확인
	var can_pickup = false
	var max_stack = item_data.max_stack if "max_stack" in item_data else 99
	
	for slot in InventoryManager.get_inventory_slots():
		# 빈 슬롯
		if slot.item_data == null:
			can_pickup = true
			break
		# 동일 아이템 & 동일 등급 & 공간 있음
		if slot.item_data.name == item_data.name and slot.quality == quality and slot.amount < max_stack:
			can_pickup = true
			break

	if not can_pickup:
		# 공간이 없으면 습득 애니메이션/로직을 아예 실행하지 않음
		return

	_is_collecting = true
	Callable(disable_collision).call_deferred()

	# 습득 애니메이션 (Tween) 시작
	# 인벤토리에 일부만 들어가는 경우에도 애니메이션은 실행됨
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_method(tween_collect.bind(global_position), 0.0, 1.0, 0.5) \
		.set_ease(Tween.EASE_IN) \
		.set_trans(Tween.TRANS_BACK)
	tween.tween_property(sprite, "scale", Vector2.ZERO, 0.05).set_delay(0.45)
	tween.chain()
	tween.tween_callback(collect)


func tween_collect(percent: float, start_position: Vector2):
	var player = get_tree().get_first_node_in_group("player")
	if player == null:
		return
	global_position = start_position.lerp(player.global_position, percent)
	var direction_from_start = player.global_position - start_position
	var target_rotation = direction_from_start.angle() + deg_to_rad(90)
	rotation = lerp_angle(rotation, target_rotation, 1 - exp(-2 * get_process_delta_time()))


func collect():
	# add_item은 실제로 인벤토리에 들어간 개수를 반환
	var added = InventoryManager.add_item(item_data, amount, quality)
	if added >= amount:
		# 모두 인벤토리에 들어갔으면 맵에서 제거
		queue_free()
	else:
		# 초과분이 남아 맵에 남는 경우
		amount -= added
		# Sprite와 Collision을 원상복구 (Tween에서 scale이 0이 되었으므로)
		sprite.scale = original_scale
		collision_shape_2d.disabled = false
		_is_collecting = false # 다시 습득 가능하도록 플래그 해제
		# 필요하다면 위치/수량 표시 등도 갱신


# 드랍(버리기) 시 사용
func setup_drop(drop_item_data: ItemData, drop_amount: int, drop_quality: int = 0):
	self.item_data = drop_item_data
	self.amount = drop_amount
	self.quality = drop_quality
	if sprite:
		sprite.texture = drop_item_data.icon if drop_item_data else null

# 아이템이 튀어나오는 연출
func animate_drop(start_pos: Vector2, target_pos: Vector2):
	global_position = start_pos
	
	# 수거 불가능 딜레이 (애니메이션 동안 먹지 못하게)
	_is_collecting = true
	
	var duration = 0.4
	var height = 32.0 # 점프 높이
	
	var tween = create_tween()
	
	# [1] X/Y 이동 (직선)
	tween.set_parallel(true)
	tween.tween_property(self, "global_position:x", target_pos.x, duration).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "global_position:y", target_pos.y, duration).set_ease(Tween.EASE_OUT)
	
	# [2] 높이 (점프) - 시각적 Y 오프셋 (Sprite만 움직임)
	# 오프셋을 주기 위해 Sprite의 position을 조작
	var jump_tween = create_tween()
	jump_tween.tween_property(sprite, "position:y", -height, duration * 0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
	jump_tween.chain().tween_property(sprite, "position:y", 0.0, duration * 0.5).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_QUAD)
	
	# 애니메이션 종료 후
	jump_tween.finished.connect(func():
		_is_collecting = false # 수거 가능 상태로 전환
		
		# [중요] 제자리에서 즉시 습득을 위해 수동 체크
		# 이미 플레이어가 위에 서 있을 경우 area_entered가 발생하지 않을 수 있음
		if area_2d.has_overlapping_areas():
			for area in area_2d.get_overlapping_areas():
				# 플레이어의 Pickup Area인지 확인하고 수동으로 진입 처리
				# 주의: _on_area_entered는 내부적으로 필터링이 없으므로, 
				# 충돌 레이어 설정이 올바르다면 그냥 호출해도 무방함.
				_on_area_entered(area)
	)
