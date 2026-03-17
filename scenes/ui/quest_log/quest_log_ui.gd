extends Control

# Nodes
@onready var active_list = %ActiveList
@onready var completed_list = %CompletedList
@onready var right_pane_title = %TitleLabel
@onready var right_pane_desc = %DescLabel
@onready var obj_container = %ObjectiveList

# Data
var misc_quests: Array[QuestResource] = []

func _ready() -> void:
	# Clear dummy content if any
	_clear_children(active_list)
	_clear_children(completed_list)
	_clear_children(obj_container)
	
	# Clear Right Pane (Empty State)
	right_pane_title.text = ""
	right_pane_desc.text = ""
	
	refresh_ui()
	
	# Select first available if any
	# if active_list.get_child_count() > 0:
	# 	active_list.get_child(0).pressed.emit()

func refresh_ui() -> void:
	misc_quests.clear()
	
	print("QuestLogUI: Refreshing UI. Active Quests: ", QuestManager.active_quests.keys())
	
	# 1. Process Active Quests
	for q_id in QuestManager.active_quests:
		var quest = QuestManager.active_quests[q_id]
		if quest.is_miscellaneous:
			misc_quests.append(quest)
		else:
			_create_quest_button(quest, active_list, false)
			
	# 2. Add Misc Button if needed
	if not misc_quests.is_empty():
		var btn = Button.new()
		btn.text = "Miscellaneous Quests"
		btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
		btn.pressed.connect(_on_misc_selected)
		active_list.add_child(btn)
		
	# 3. Process Completed Quests
	for q_id in QuestManager.completed_quests:
		if QuestManager.quest_database.has(q_id):
			var quest = QuestManager.quest_database[q_id]
			# Ensure we don't show Misc quests in completed list individualy? 
			# User requirement: "All quests... move to completed".
			# For misc quests, they might finish individually. 
			# Let's show them safely.
			_create_quest_button(quest, completed_list, true)

func _create_quest_button(quest: QuestResource, parent: Node, is_completed: bool) -> void:
	var btn = Button.new()
	btn.text = quest.title
	btn.alignment = HORIZONTAL_ALIGNMENT_LEFT
	if is_completed:
		btn.modulate = Color(0.7, 0.7, 0.7) # Dimmed
		
	btn.pressed.connect(func(): _on_quest_selected(quest))
	parent.add_child(btn)

func _on_quest_selected(quest: QuestResource) -> void:
	_update_right_pane(quest.title, quest.description, quest.objectives, false)

func _on_misc_selected() -> void:
	# For misc, we list all objectives of all misc quests
	var title = "Miscellaneous Quests"
	var desc = "Various small tasks pending completion."
	var combined_objectives: Array[QuestObjectiveResource] = []
	
	for q in misc_quests:
		combined_objectives.append_array(q.objectives)
		
	_update_right_pane(title, desc, combined_objectives, true)

func _update_right_pane(title: String, desc: String, objectives: Array, is_misc_view: bool) -> void:
	right_pane_title.text = title
	right_pane_desc.text = desc
	
	_clear_children(obj_container)
	
	for obj in objectives:
		var label = Label.new()
		var progress = ""
		if obj.has_method("get_progress_text"):
			progress = obj.get_progress_text(QuestManager)
			
		var status = "[ ]"
		if obj is QuestObjectiveResource:
			if obj.is_completed(QuestManager):
				status = "[x]"
		
		# For misc view, maybe show Quest Title too?
		# "Bring 3 gold (Quest A)"
		
		label.text = "%s %s %s" % [status, obj.description, progress]
		obj_container.add_child(label)

func _clear_children(node: Node) -> void:
	for c in node.get_children():
		c.queue_free()
