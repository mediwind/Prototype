extends Control

@onready var button = $Button
@onready var entities_layer = get_tree().get_first_node_in_group("entities_layer")

@export var player_human_scene: PackedScene


func _ready():
	button.pressed.connect(_on_button_pressed)
	call_deferred("update_button_text") # 버튼 텍스트 업데이트를 위해 지연 호출


func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_button_pressed()


func _on_button_pressed():
	if PlayerControlManager.current_player is PlayerTower:
		# 하차: PlayerHuman 인스턴스 생성, set_control(PlayerHuman)
		var player_human = player_human_scene.instantiate()
		# PlayerTower 위치 근처에 배치
		player_human.global_position = PlayerControlManager.current_player.global_position + Vector2(32, 0)
		entities_layer.add_child(player_human)
		PlayerControlManager.set_control(player_human)
	else:
		# 탑승: set_control(PlayerTower), PlayerHuman 삭제
		var player_tower = entities_layer.get_node("PlayerTower")
		var player_human = entities_layer.get_node("PlayerHuman")
		PlayerControlManager.set_control(player_tower)
		player_human.queue_free() # 기존 PlayerHuman 삭제
	update_button_text()


func update_button_text():
	if PlayerControlManager.current_player is PlayerTower:
		button.text = "하차"
	else:
		button.text = "탑승"
