extends Resource
class_name BulletData

@export var speed: int = 1500 # 총알 속도
@export var max_distance: float = 700.0 # 총알 최대 거리
@export var damage: int = 10 # 총알 데미지
@export var penetration: int = 1 # 총알 관통력 (몇 명의 적을 관통할 수 있는지)
@export var bullet_scene: PackedScene # 총알의 씬 (예: basic_bullet.tscn)