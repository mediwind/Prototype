extends Control

@export var slot_scene: PackedScene

@onready var player_grid: GridContainer = $ContainerPanel/MarginContainer/HBoxContainer/PlayerSection/PlayerGrid
@onready var chest_grid: GridContainer = $ContainerPanel/MarginContainer/HBoxContainer/ChestSection/ChestGrid
@onready var title_label: Label = $ContainerPanel/MarginContainer/HBoxContainer/ChestSection/Label

var inventory_data: InventoryData = null

const GROUP_INVENTORY_UI = "inventory_ui"

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS # Handle input while paused
	add_to_group(GROUP_INVENTORY_UI)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		close()
		get_viewport().set_input_as_handled() # Consume input

func open(data: InventoryData, title: String = "Chest"):
	inventory_data = data
	title_label.text = title
	_initialize_chest_slots()
	_initialize_player_slots()
	show()
	
func close():
	hide()
	queue_free()
	get_tree().paused = false

func _initialize_chest_slots():
	for child in chest_grid.get_children():
		child.queue_free()
	
	if not inventory_data: return

	for i in range(inventory_data.inventory_slots.size()):
		var slot_data = inventory_data.inventory_slots[i]
		var slot_node = slot_scene.instantiate()
		
		if "inventory_data_owner" in slot_node:
			slot_node.inventory_data_owner = inventory_data
		
		slot_node.slot_type = "chest_inventory" # Distinct Type
		slot_node.slot_index = i
		
		slot_node.connect("slot_ui_needs_refresh", _on_any_slot_refresh)
		chest_grid.add_child(slot_node)
		slot_node.set_slot_data(slot_data)

func _initialize_player_slots():
	for child in player_grid.get_children():
		child.queue_free()
		
	var player_slots = InventoryManager.get_inventory_slots()
	
	for i in range(player_slots.size()):
		var slot_data = player_slots[i]
		var slot_node = slot_scene.instantiate()
		
		if "inventory_data_owner" in slot_node:
			slot_node.inventory_data_owner = null
			
		slot_node.slot_type = "player_inventory" # Distinct Type
		slot_node.slot_index = i
		
		slot_node.connect("slot_ui_needs_refresh", _on_any_slot_refresh)
		player_grid.add_child(slot_node)
		slot_node.set_slot_data(slot_data)

func _on_any_slot_refresh(type: String, idx: int):
	# Route refresh to correct grid
	if type == "chest_inventory":
		if not inventory_data or idx < 0 or idx >= inventory_data.inventory_slots.size(): return
		var slot_data = inventory_data.inventory_slots[idx]
		if idx < chest_grid.get_child_count():
			chest_grid.get_child(idx).set_slot_data(slot_data)
			
	elif type == "player_inventory":
		var player_slots = InventoryManager.get_inventory_slots()
		if idx < 0 or idx >= player_slots.size(): return
		var slot_data = player_slots[idx]
		if idx < player_grid.get_child_count():
			player_grid.get_child(idx).set_slot_data(slot_data)
