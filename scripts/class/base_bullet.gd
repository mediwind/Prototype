extends Node2D
class_name BaseBullet

@export var components: Array = []  # 추가된 Component 목록

@onready var hitbox_component: HitboxComponent = $HitboxComponent

var bullet_data: BulletData  # BulletData 리소스
var direction: Vector2
var initial_position: Vector2
var penetration_count: int = 0  # 현재 관통한 적의 수


func _ready():
    if hitbox_component:
        hitbox_component.damage = bullet_data.damage

    initial_position = global_position

    # Component 초기화
    for component in components:
        if component.has_method("initialize"):
            component.initialize(self)


func _process(delta):
    # 총알 이동
    position += bullet_data.speed * direction * delta

    # 최대 거리 초과 시 제거
    if position.distance_squared_to(initial_position) > bullet_data.max_distance * bullet_data.max_distance:
        queue_free()


func on_hit(target: Area2D):
    # Component의 on_hit 호출, components를 순회하는 이유는 총알 하나에 부여된 여러 Component 효과를 모두 적용하기 위해서
    for component in components:
        if component.has_method("on_hit"):
            component.on_hit(target)

    # 기본 관통 처리
    if target is HurtboxComponent:
        penetration_count += 1
        if penetration_count >= bullet_data.penetration:
            queue_free()