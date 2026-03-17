extends Resource
class_name QuestObjectiveResource

@export var description: String = "Complete objective"

# Virtual method to check if this objective is met
# We pass quest_manager (or context) to allow access to Inventory, NPC, etc.
func is_completed(_context: Node) -> bool:
	return false

# Optional: Progress string (e.g. "3/5")
func get_progress_text(_context: Node) -> String:
	return ""

# Virtual method called when quest is completed (e.g., to consume items)
func on_complete(_context: Node) -> void:
	pass
