extends Node
class_name ShooterComponent

@export var bullet_data: BulletData  # 발사할 총알의 데이터
@export var muzzle: Node2D  # 총알이 발사될 위치


func shoot(target_position: Vector2):
	var bullet = bullet_data.bullet_scene.instantiate()
	bullet.global_position = muzzle.global_position

	# 방향 설정
	bullet.direction = (target_position - muzzle.global_position).normalized()

	# 회전 설정
	bullet.rotation = atan2(bullet.direction.y, bullet.direction.x)

	# BulletData 리소스를 설정
	bullet.bullet_data = bullet_data.duplicate()  # 리소스 복제

	# 플레이어인 경우 스탯 반영 (예: 원거리 공격력)
	var damage = bullet_data.damage
	if owner.is_in_group("player"):
		damage += StatManager.player_stat.get_stat("attack")
	bullet.bullet_data.damage = damage

	var foreground = get_tree().get_first_node_in_group("foreground_layer")
	foreground.add_child(bullet)
