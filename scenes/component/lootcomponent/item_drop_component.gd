extends Node
class_name ItemDropComponent

@export var drop_data_list: Array[DropData]

const COLLECTABLE_SCENE = preload("res://scenes/game_object/loot/collectable_object.tscn")

func drop_items() -> void:
	var entity = get_parent()
	
	if not entity is Node2D:
		push_warning("ItemDropComponent: Parent is not Node2D")
		return
		
	var owner_pos = (entity as Node2D).global_position
	
	for data in drop_data_list:
		if data == null or data.item_data == null:
			continue
			
		if randf() <= data.drop_chance:
			var amount = randi_range(data.min_amount, data.max_amount)
			for i in range(amount):
				_spawn_drop(data.item_data, owner_pos, entity.get_parent())

func _spawn_drop(item: ItemData, spawn_pos: Vector2, parent_node: Node) -> void:
	var drop = COLLECTABLE_SCENE.instantiate()
	
	# Add to the world (parent of the entity)
	if parent_node:
		parent_node.call_deferred("add_child", drop)
	else:
		return
	
	# Setup position and jump
	drop.global_position = spawn_pos
	drop.setup_drop(item, 1)
	
	var random_offset = Vector2(randf_range(-16, 16), randf_range(-16, 16))
	# Wait a frame for add_child to complete before interacting with physics/tween
	await drop.ready
	drop.animate_drop(spawn_pos, spawn_pos + random_offset)
