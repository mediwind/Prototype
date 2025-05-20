extends CharacterBody2D

@onready var shooter_component = $ShooterComponent
@onready var shoot_cool_time = $ShootCooltime
@onready var muzzle = %Muzzle
@onready var audio_stream_player = $AudioStreamPlayer
@onready var turret_sprite = $TurretSprite
@onready var attack_range = $AttackRange

const MAX_SPEED = 0

var can_shoot : bool
var enemies_in_range : Array = [] # 범위내 적들을 저장하는 배열
var is_preview: bool = false # 미리보기 상태인지 여부


func _ready():
    if is_preview:
        set_preview_mode()
        return

    can_shoot = true
    shoot_cool_time.timeout.connect(on_shoot_cool_time_timeout)
    attack_range.body_entered.connect(on_body_entered)
    attack_range.body_exited.connect(on_body_exited)


func set_preview_mode():
    # 공격 범위, 쿨타임, 사운드 등 비활성화
    if has_node("AttackRange"):
        $AttackRange.monitoring = false
        $AttackRange.set_deferred("monitorable", false)
    if has_node("CollisionShape2D"):
        $CollisionShape2D.disabled = true
    if has_node("ShootCooltime"):
        $ShootCooltime.stop()
    if has_node("AudioStreamPlayer"):
        $AudioStreamPlayer.stop()


# 발사 로직을 별도 함수로 분리
func shoot_bullet():
    if enemies_in_range.size() == 0 or not can_shoot:
        return

    # 가장 가까운 적을 찾기
    var closest_enemy = get_closest_enemy()
    if closest_enemy == null:
        return

    var direction = (closest_enemy.global_position - global_position).normalized()
    # 터렛(총구)의 방향만 적을 향하도록
    turret_sprite.rotation = direction.angle()

    # ShooterComponent를 통해 총알 발사
    shooter_component.shoot(closest_enemy.global_position)

	# 발사 애니메이션 재생
    turret_sprite.play("fire")

    # 쿨타임 시작
    can_shoot = false
    shoot_cool_time.start()
    audio_stream_player.play()  # 총소리 재생


# 쿨타임이 끝났을 때 자동 발사 처리
func on_shoot_cool_time_timeout():
    can_shoot = true
    shoot_bullet()


# 가장 가까운 적을 찾는 함수
func get_closest_enemy():
    var closest_enemy = null
    var closest_distance = INF

    for enemy in enemies_in_range:
        if not enemy or not enemy.is_inside_tree():
            continue
        
        var distance = global_position.distance_to(enemy.global_position)
        if distance < closest_distance:
            closest_distance = distance
            closest_enemy = enemy

    return closest_enemy


# 적이 범위에 들어왔을 때 호출
func on_body_entered(body: Node):
    if body.is_in_group("enemy"):
        enemies_in_range.append(body)


# 적이 범위를 벗어났을 때 호출
func on_body_exited(body: Node):
    if body.is_in_group("enemy"):
        enemies_in_range.erase(body)