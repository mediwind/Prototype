extends Node

# Dictionary to store dynamic NPC data
# Key: NPC ID (String)
# Value: Dictionary { "affection": int, "talked_today": bool, ... }
var npc_data: Dictionary = {}

func get_affection(npc_id: String) -> int:
	if not npc_data.has(npc_id):
		return 0
	return npc_data[npc_id].get("affection", 0)

func change_affection(npc_id: String, amount: int) -> void:
	if not npc_data.has(npc_id):
		npc_data[npc_id] = {"affection": 0}
	
	var current = npc_data[npc_id].get("affection", 0)
	npc_data[npc_id]["affection"] = current + amount
	print("NPCManager: %s affection changed by %d. New value: %d" % [npc_id, amount, npc_data[npc_id]["affection"]])

# Called by SaveManager to get data for saving
func get_save_data() -> Dictionary:
	return npc_data

# Called by SaveManager to load data
func load_save_data(data: Dictionary) -> void:
	npc_data = data.duplicate(true)
