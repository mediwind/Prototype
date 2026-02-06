extends QuestObjectiveResource
class_name ObjectiveItem

@export var target_item: ItemData
@export var target_amount: int = 1

func is_completed(_context: Node) -> bool:
	if not target_item:
		return true # Prevent blocking if data is missing
		
	# Access InventoryManager (Singleton)
	return InventoryManager.has_item(target_item, target_amount)

func get_progress_text(_context: Node) -> String:
	if not target_item: return ""
	
	# Use InventoryManager.get_item_count
	var current = InventoryManager.get_item_count(target_item)
	return "%d/%d" % [current, target_amount]

func on_complete(_context: Node) -> void:
	if target_item and target_amount > 0:
		InventoryManager.consume_item(target_item, target_amount)
		# print("QuestObjective: Consumed %d %s" % [target_amount, target_item.name])
