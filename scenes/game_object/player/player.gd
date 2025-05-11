extends CharacterBody2D

signal shoot

@onready var shooter_component = $ShooterComponent
@onready var shoot_cool_time = $ShootCooltime
@onready var muzzle = %Muzzle
@onready var audio_stream_player = $AudioStreamPlayer
@onready var turret_sprite = $TurretSprite

const MAX_SPEED = 100

var can_shoot : bool
var is_mouse_pressed : bool = false  # 마우스 버튼 상태 추적


func _ready():
	can_shoot = true
	shoot_cool_time.timeout.connect(on_shoot_cool_time_timeout)


func _process(_delta):
	turn()
	var direction = get_movement_vector()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement).normalized()


func turn():
	var enemy_position = get_global_mouse_position()
	turret_sprite.look_at(enemy_position)


# Handle player shooting based on input
func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_mouse_pressed = true  # 마우스 버튼 눌림 상태
				if can_shoot:
					shoot_bullet()
			else:
				is_mouse_pressed = false  # 마우스 버튼 떼어짐


# 발사 로직을 별도 함수로 분리
func shoot_bullet():
	var target_position = get_global_mouse_position()
	shooter_component.shoot(target_position) # ShooterComponent를 통해 총알 발사

	# 발사 애니메이션 재생
	turret_sprite.play("fire")

	# 쿨타임 시작
	can_shoot = false
	shoot_cool_time.start()
	audio_stream_player.play()  # 총소리 재생


# 쿨타임이 끝났을 때 자동 발사 처리
func on_shoot_cool_time_timeout():
	can_shoot = true
	if is_mouse_pressed:  # 마우스가 눌린 상태라면 자동 발사
		shoot_bullet()
