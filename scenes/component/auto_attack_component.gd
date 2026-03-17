extends Node

@export var attack_range_path: NodePath
@export var shooter_component_path: NodePath
@export var shoot_cool_time_path: NodePath
@export var turret_sprite_path: NodePath
@export var audio_stream_player_path: NodePath

var can_shoot := true
var enemies_in_range: Array = []


func _ready():
    if attack_range_path != NodePath():
        var attack_range = get_node(attack_range_path)
        attack_range.body_entered.connect(_on_body_entered)
        attack_range.body_exited.connect(_on_body_exited)
    if shoot_cool_time_path != NodePath():
        var shoot_cool_time = get_node(shoot_cool_time_path)
        shoot_cool_time.timeout.connect(_on_shoot_cool_time_timeout)


func auto_attack(owner):
    if enemies_in_range.size() == 0 or not can_shoot:
        return

    var closest_enemy = _get_closest_enemy(owner)
    if closest_enemy == null:
        return

    # 터렛 방향 조정 (있으면)
    if turret_sprite_path != NodePath():
        var turret_sprite = get_node(turret_sprite_path)
        var direction = (closest_enemy.global_position - owner.global_position).normalized()
        turret_sprite.rotation = direction.angle()

    # 발사
    var shooter_component = get_node(shooter_component_path)
    shooter_component.shoot(closest_enemy.global_position)

    # 애니메이션
    if turret_sprite_path != NodePath():
        get_node(turret_sprite_path).play("fire")

    # 쿨타임
    can_shoot = false
    get_node(shoot_cool_time_path).start()
    if audio_stream_player_path != NodePath():
        get_node(audio_stream_player_path).play()


func _on_shoot_cool_time_timeout():
    can_shoot = true


func _on_body_entered(body):
    if body.is_in_group("enemy"):
        enemies_in_range.append(body)


func _on_body_exited(body):
    if body.is_in_group("enemy"):
        enemies_in_range.erase(body)


func _get_closest_enemy(owner):
    var closest_enemy = null
    var closest_distance = INF
    for enemy in enemies_in_range:
        if not enemy or not enemy.is_inside_tree():
            continue
        var distance = owner.global_position.distance_to(enemy.global_position)
        if distance < closest_distance:
            closest_distance = distance
            closest_enemy = enemy
    return closest_enemy
