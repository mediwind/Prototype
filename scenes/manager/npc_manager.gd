extends Node

# Dictionary to store dynamic NPC data
# Key: NPC ID (String)
# Value: Dictionary { "affection": int, "talked_today": bool, "flags": Dictionary }
var npc_data: Dictionary = {}

# Additional state tracking (Position, Scene)
# Key: NPC ID (String)
# Value: Dictionary { "scene_path": String, "position": Vector2 }
var npc_states: Dictionary = {}

# Active NPC Instances (for capturing state of currently loaded NPCs)
var active_npcs: Array[Node] = []

func register_active_npc(npc_node: Node) -> void:
	if not active_npcs.has(npc_node):
		active_npcs.append(npc_node)

func unregister_active_npc(npc_node: Node) -> void:
	if active_npcs.has(npc_node):
		active_npcs.erase(npc_node)

# --- Generic Flag System (Memory) ---

func set_flag(npc_id: String, key: String, value: Variant) -> void:
	if not npc_data.has(npc_id):
		npc_data[npc_id] = {}
	
	if not npc_data[npc_id].has("flags"):
		npc_data[npc_id]["flags"] = {}
		
	npc_data[npc_id]["flags"][key] = value
	# print("NPCManager: Set flag [%s] for %s to %s" % [key, npc_id, value])

func get_flag(npc_id: String, key: String, default: Variant = null) -> Variant:
	if not npc_data.has(npc_id):
		return default
	if not npc_data[npc_id].has("flags"):
		return default
	return npc_data[npc_id]["flags"].get(key, default)

# --- High-Level Helpers ---

func has_met(npc_id: String) -> bool:
	return get_flag(npc_id, "met", false)

func set_met(npc_id: String) -> void:
	set_flag(npc_id, "met", true)

# --- Affection System ---

func get_affection(npc_id: String) -> int:
	if not npc_data.has(npc_id):
		return 0
	return npc_data[npc_id].get("affection", 0)

func change_affection(npc_id: String, amount: int) -> void:
	if not npc_data.has(npc_id):
		npc_data[npc_id] = {} # Initialize empty dict first
	
	var current = npc_data[npc_id].get("affection", 0)
	npc_data[npc_id]["affection"] = current + amount
	print("NPCManager: %s affection changed by %d. New value: %d" % [npc_id, amount, npc_data[npc_id]["affection"]])

func update_npc_state(npc_id: String, scene_path: String, pos: Vector2) -> void:
	npc_states[npc_id] = {
		"scene_path": scene_path,
		"position": pos
	}
	# print("NPCManager: Saved state for %s -> %s" % [npc_id, pos])

func get_npc_state(npc_id: String) -> Dictionary:
	return npc_states.get(npc_id, {})

# Called by SaveManager to get data for saving
func get_save_data() -> Dictionary:
	# CRITICAL: Force update state from all active NPCs before saving
	# because _exit_tree() hasn't run yet if we are saving mid-game.
	for npc in active_npcs:
		if is_instance_valid(npc) and npc.identity:
			var current_scene = npc.get_tree().current_scene.scene_file_path if npc.get_tree().current_scene else ""
			update_npc_state(npc.identity.id, current_scene, npc.global_position)
			
	return {
		"npc_data": npc_data,
		"npc_states": npc_states
	}

# Called by SaveManager to load data
func load_save_data(data: Dictionary) -> void:
	npc_data = data.get("npc_data", {}).duplicate(true)
	npc_states = data.get("npc_states", {}).duplicate(true)
	
func reset_data() -> void:
	npc_data = {}
	npc_states = {}
