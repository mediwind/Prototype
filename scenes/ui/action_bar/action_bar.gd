extends HBoxContainer

const SLOT_COUNT = 8
var slot_scene = preload("res://scenes/ui/skill/skill_button.tscn")

func _ready():
	# Clean up placeholder children if any
	for child in get_children():
		child.queue_free()
	
	# Create Slots
	for i in range(SLOT_COUNT):
		var slot = slot_scene.instantiate()
		add_child(slot)
		
		# Configure as Action Slot
		# Slot index 0 -> Key "1"
		# Slot index 1 -> Key "2" ...
		var key_text = str(i + 1)
		slot.set_slot_index(i, key_text)
	
	# Connect to Signal
	SkillManager.equipped_skills_changed.connect(_on_equipped_skills_changed)


func _on_equipped_skills_changed():
	for child in get_children():
		if child is SkillButton:
			child.set_slot_index(child.slot_index, child.assigned_key_text)
