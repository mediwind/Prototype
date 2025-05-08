extends Node

const SPAWN_RADIUS = 375

@export var basic_enemy_scene : PackedScene
@export var wizard_enemy_scene : PackedScene
# @export var bat_enemy_scene: PackedScene
@export var arena_time_manager : Node

@onready var normal_timer = $NormalTimer
@onready var circle_timer = $CircleTimer
@onready var swarm_timer = $SwarmTimer

var base_spawn_time = 0
var enemy_table = WeightedTable.new()
var number_to_spawn = 1


func _ready():
	enemy_table.add_item(basic_enemy_scene, 10)

	base_spawn_time = normal_timer.wait_time

	normal_timer.timeout.connect(on_normal_timer_timeout)
	circle_timer.timeout.connect(on_circle_timer_timeout)
	swarm_timer.timeout.connect(on_swarm_timer_timeout)

	arena_time_manager.arena_difficulty_increased.connect(on_arena_difficulty_increased)


# 공통 함수: 플레이어 노드 가져오기
func get_player() -> Node2D:
	return get_tree().get_first_node_in_group("player") as Node2D


# 공통 함수: 스폰 위치 계산
func get_spawn_position(player: Node2D) -> Vector2:
	var spawn_position = Vector2.ZERO
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	for i in range(4):
		spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
		var additional_check_offset = random_direction * 20

		var query_parameters = PhysicsRayQueryParameters2D.create(player.global_position, spawn_position + additional_check_offset, 1)
		var result = get_tree().root.world_2d.direct_space_state.intersect_ray(query_parameters)

		if result.is_empty():
			break
		else:
			random_direction = random_direction.rotated(deg_to_rad(90))
		
	return spawn_position


# 공통 함수: 적을 특정 위치에 스폰
func spawn_enemies_at_positions(positions: Array):
	var entities_layer = get_tree().get_first_node_in_group("entities_layer")
	for position in positions:
		var enemy_scene = enemy_table.pick_item()
		var enemy = enemy_scene.instantiate() as Node2D
		entities_layer.add_child(enemy)
		enemy.global_position = position


# NormalTimer: 일반 적 스폰
func on_normal_timer_timeout():
	normal_timer.start()

	var player = get_player()
	if player == null:
		return

	var positions = []
	for i in range(number_to_spawn):
		positions.append(get_spawn_position(player))
	spawn_enemies_at_positions(positions)


# CircleTimer: 원형으로 적 스폰
func on_circle_timer_timeout():
	var player = get_player()
	if player == null:
		return

	var num_enemies = 30  # 원형으로 소환할 적의 수
	var angle_step = TAU / num_enemies  # 각도 간격
	var positions = []

	for i in range(num_enemies):
		var angle = i * angle_step
		var spawn_position = player.global_position + Vector2.RIGHT.rotated(angle) * SPAWN_RADIUS
		positions.append(spawn_position)

	spawn_enemies_at_positions(positions)


# SwarmTimer: 무작위 방향에서 적 스폰
func on_swarm_timer_timeout():
	var player = get_player()
	if player == null:
		return

	var num_enemies = 15  # 한 번에 소환할 적의 수
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))  # 무작위 방향
	var spawn_origin = player.global_position + random_direction * SPAWN_RADIUS
	var positions = []

	for i in range(num_enemies):
		var spawn_position = spawn_origin + Vector2(randf_range(-50, 50), randf_range(-50, 50))  # 약간의 랜덤 오프셋 추가
		positions.append(spawn_position)

	spawn_enemies_at_positions(positions)


func on_arena_difficulty_increased(arena_difficulty: int):
	var time_off = (.1 / 12) * arena_difficulty
	time_off = min(time_off, .7)
	normal_timer.wait_time = base_spawn_time - time_off

	if arena_difficulty == 1:
		enemy_table.add_item(wizard_enemy_scene, 15)
	# if arena_difficulty == 18:
	# 	enemy_table.add_item(bat_enemy_scene, 8)
	
	if (arena_difficulty % 15) == 0:
		number_to_spawn += 1
