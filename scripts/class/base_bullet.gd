extends Node2D
class_name BaseBullet  # 공통 부모 클래스

var bullet_data: BulletData  # BulletData 리소스
var direction: Vector2
var initial_position: Vector2
var penetration_count: int = 0  # 현재 관통한 적의 수

func _ready():
    initial_position = global_position


func _process(delta):
    # 총알 이동
    position += bullet_data.speed * direction * delta

    # 총알이 최대 거리를 초과하면 제거
    if position.distance_squared_to(initial_position) > bullet_data.max_distance * bullet_data.max_distance:
        queue_free()


func on_hit(target: Area2D):
    if target is HurtboxComponent:
        penetration_count += 1
        if penetration_count >= bullet_data.penetration:
            queue_free()