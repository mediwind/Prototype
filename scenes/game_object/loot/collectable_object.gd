extends Node2D

@export var item_data: ItemData
@export var amount: int = 1

@onready var area_2d = $Area2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var sprite = $Sprite2D

var _is_collecting := false # 중복 습득 방지 플래그
var original_scale := Vector2.ONE # 아이템마다 다른 원본 스케일 저장


func _ready():
	area_2d.area_entered.connect(_on_area_entered)
	sprite.texture = item_data.icon if item_data else null
	original_scale = sprite.scale # PNG마다 다를 수 있으니 동적으로 저장


func disable_collision():
	collision_shape_2d.disabled = true


func _on_area_entered(other_area):
	if _is_collecting:
		return

	# 1. 인벤토리에 공간이 있는지 미리 체크
	# 모든 슬롯이 가득 찬 경우 습득 애니메이션/로직 자체를 실행하지 않음
	var can_pickup = false
	for slot in InventoryManager.get_inventory_slots():
		if (slot.item_data == null) or\
			(slot.item_data.name == item_data.name and slot.amount < (item_data.max_stack if "max_stack" in item_data else 99)):
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
	tween.tween_method(tween_collect.bind(global_position), 0.0, 1.0, 0.5)\
		.set_ease(Tween.EASE_IN)\
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
	var added = InventoryManager.add_item(item_data, amount)
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
func setup_drop(item_data: ItemData, amount: int):
	self.item_data = item_data
	self.amount = amount
	if sprite:
		sprite.texture = item_data.icon if item_data else null
