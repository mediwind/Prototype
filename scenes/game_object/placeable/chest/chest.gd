extends PlaceableObject
class_name Chest

@export var inventory_data: InventoryData

# Signal town can listen to open UI? Or Interact returns result?
# Usually Player calls interact() and we emit a signal or return an object.

func _ready():
	super._ready()
	
	# Create a unique inventory if not assigned (Runtime intialization)
	if not inventory_data:
		inventory_data = InventoryData.new()
		# Chest size from design doc? Let's say 10 or 20.
		inventory_data.ensure_slots(20, 0, 0) # 20 slots, 0 hotbar, 0 equipment
	
	# Default name for saving?
	if name == "":
		name = "Chest"

func _exit_tree():
	# Sync data back to BuildManager before destruction (Scene Switch)
	if has_meta("grid_coords"):
		BuildManager.update_object_custom_data(get_meta("grid_coords"), get_save_data())

func interact(_user: Node2D) -> Variant:
	# Return the inventory data so the caller (Town/UI) can display it
	return inventory_data

func get_save_data() -> Dictionary:
	# Serialize Inventory
	inventory_data.prepare_serialization()
	
	var data = {
		"slots": []
	}
	
	for slot in inventory_data.inventory_slots:
		data["slots"].append({
			"item_id": slot.saved_item_id,
			"amount": slot.amount
		})
		
	return data

func load_save_data(data: Dictionary) -> void:
	if not data.has("slots"):
		return
		
	var slots = data["slots"]
	# Ensure capacity
	inventory_data.ensure_slots(slots.size(), 0, 0)
	
	for i in range(slots.size()):
		if i < inventory_data.inventory_slots.size():
			var slot_info = slots[i]
			var slot = inventory_data.inventory_slots[i]
			slot.saved_item_id = slot_info["item_id"]
			slot.amount = slot_info["amount"]
			
	# Restore references
	inventory_data.restore_item_references()
