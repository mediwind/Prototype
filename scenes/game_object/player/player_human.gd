extends CharacterBody2D
class_name PlayerHuman

const MAX_SPEED = 200


func _ready():
	InventoryManager.hand_equipped.connect(_on_hand_equipped)

func _process(_delta):
	var direction = get_movement_vector()
	velocity = direction * MAX_SPEED
	move_and_slide()
	
	if direction.x != 0:
		face_direction(direction)


func face_direction(dir: Vector2):
	if dir.x > 0:
		$Sprite2D.flip_h = false
	elif dir.x < 0:
		$Sprite2D.flip_h = true

func perform_action(item: ItemData, target_pos: Vector2) -> Dictionary:
	# Face the target direction
	var dir = (target_pos - global_position).normalized()
	face_direction(dir)
	return $EquipmentActionHandler.attempt_action(self, item, target_pos)

func _input(event):
	for i in range(1, 10):
		if event.is_action_pressed("hotbar_" + str(i)):
			InventoryManager.equip_to_hand(i - 1)
			get_viewport().set_input_as_handled()
			return

func _on_hand_equipped(item_data: ItemData):
	var hand_anchor = $HandAnchor
	var tool_sprite = $HandAnchor/ToolSprite
	
	if item_data and item_data.icon:
		tool_sprite.texture = item_data.icon
		hand_anchor.visible = true
	else:
		hand_anchor.visible = false
		tool_sprite.texture = null

func get_movement_vector():
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	return Vector2(x_movement, y_movement).normalized()
