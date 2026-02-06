extends Control

@onready var label: RichTextLabel = $Panel/MarginContainer/Label

func _ready() -> void:
	# visible = true # Default is true in scene, but let's ensure. 
	# Actually, UIManager adds it to Windows. Updates content immediately.
	update_log()
	# The window logic in UIManager handles HUD visibility globally when _open_window is called.

# Removed _unhandled_input as UIManager handles "J" key globally.
# This prevents constraints with focus or hidden state.

func toggle_visibility() -> void:
	# Deprecated self-toggle.
	pass

func update_log() -> void:
	var text = "[b]Quest Log[/b]\n\n"
	
	if QuestManager.active_quests.is_empty():
		text += "No active quests."
	else:
		for quest_id in QuestManager.active_quests:
			var quest = QuestManager.active_quests[quest_id]
			text += "[b]- %s[/b]\n" % quest.title
			text += "  %s\n" % quest.description
			text += "  Objectives:\n"
			for obj in quest.objectives:
				var progress = obj.get_progress_text(QuestManager)
				var status = "[x]" if obj.is_completed(QuestManager) else "[ ]"
				text += "    %s %s (%s)\n" % [status, obj.description, progress]
			text += "\n"
	
	label.text = text
