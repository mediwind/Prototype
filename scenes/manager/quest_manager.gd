extends Node

# Active Quests: Key = Quest ID (String), Value = QuestResource (Instance or Ref)
# We might need to store state per objective if objectives have internal state (like counters).
# For simple checks (fetch), we just check condition every time.
var active_quests: Dictionary = {}

# Completed Quests: List of IDs
var completed_quests: Array[String] = []

# Quest Database (Loaded resources)
# Key: Quest ID (String), Value: QuestResource
var quest_database: Dictionary = {}

var _quests_loaded: bool = false

func _ready() -> void:
	if not _quests_loaded:
		load_all_quests()

func load_all_quests() -> void:
	if _quests_loaded:
		return
		
	print("QuestManager: Loading quests...")
	var path = "res://resources/quest/definitions"
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if (file_name.ends_with(".tres") or file_name.ends_with(".remap")) and not file_name.contains(".tmp"):
				# Handle .remap for exported projects key
				var clean_name = file_name.replace(".remap", "")
				var full_path = path + "/" + clean_name
				var quest_res = load(full_path)
				if quest_res is QuestResource:
					if quest_res.id == "":
						push_warning("QuestManager: Quest at %s has no ID!" % full_path)
					else:
						quest_database[quest_res.id] = quest_res
						# print("QuestManager: Loaded quest %s" % quest_res.id)
			file_name = dir.get_next()
		dir.list_dir_end()
		_quests_loaded = true
	else:
		print("QuestManager: Quest definitions directory not found at %s" % path)

func start_quest(quest_id: String) -> void:
	if not _quests_loaded:
		load_all_quests()
		
	if not quest_database.has(quest_id):
		push_error("QuestManager: Quest ID %s not found in database." % quest_id)
		return
		
	var quest_def = quest_database[quest_id]
	start_quest_from_resource(quest_def)

func start_quest_from_resource(quest_def: QuestResource) -> void:
	if not quest_def: return
		
	# Check completion and repetition
	if is_quest_completed(quest_def.id) and quest_def.repeat_type == "once":
		print("QuestManager: Quest %s already completed." % quest_def.id)
		return
		
	if active_quests.has(quest_def.id):
		print("QuestManager: Quest %s already active." % quest_def.id)
		return
		
	active_quests[quest_def.id] = quest_def
	print("QuestManager: Started quest '%s'" % quest_def.title)

func complete_quest(quest_id: String) -> bool:
	if not active_quests.has(quest_id):
		print("QuestManager: Cannot complete inactive quest %s" % quest_id)
		return false
		
	var quest = active_quests[quest_id]
	
	# Validate all objectives (Double check)
	if not can_complete_quest(quest_id):
		print("QuestManager: Objectives not met for %s" % quest_id)
		return false
		
	# Apply Rewards first? Or consume first?
	# Usually consume first to prevent getting rewards if consumption fails (though we checked can_complete)
	
	# Consume Objectives (e.g., remove items)
	for objective in quest.objectives:
		objective.on_complete(self)
		
	# Apply Rewards
	for reward in quest.rewards:
		reward.give_reward(self)
		
	# Move to completed
	active_quests.erase(quest_id)
	if not completed_quests.has(quest_id):
		completed_quests.append(quest_id)
		
	print("QuestManager: Completed quest '%s'" % quest.title)
	return true

func is_quest_active(quest_id: String) -> bool:
	return active_quests.has(quest_id)

func is_quest_completed(quest_id: String) -> bool:
	return completed_quests.has(quest_id)

func can_complete_quest(quest_id: String) -> bool:
	if not active_quests.has(quest_id):
		return false
		
	var quest = active_quests[quest_id]
	for objective in quest.objectives:
		# Pass self (QuestManager) as context so objectives can access singletons
		if not objective.is_completed(self):
			return false
			
	return true

func reset_data() -> void:
	active_quests.clear()
	completed_quests.clear()
	print("QuestManager: Data reset.")

# --- Data Persistence ---

func get_save_data() -> Dictionary:
	return {
		"active_quest_ids": active_quests.keys(),
		"completed_quests": completed_quests
	}

func load_save_data(data: Dictionary) -> void:
	# Ensure DB is loaded before trying to resolve IDs
	if not _quests_loaded:
		load_all_quests()

	# Safe casting from generic Array (Variant) to Array[String]
	completed_quests.clear()
	var loaded_completed = data.get("completed_quests", [])
	if loaded_completed is Array:
		for q_id in loaded_completed:
			completed_quests.append(str(q_id))
	
	var active_ids = data.get("active_quest_ids", [])
	active_quests.clear()
	
	for q_id in active_ids:
		if quest_database.has(q_id):
			active_quests[q_id] = quest_database[q_id]
		else:
			push_error("QuestManager: Saved quest ID %s not found in database!" % q_id)
