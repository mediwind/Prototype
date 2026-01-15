extends CanvasLayer

@onready var container = $Panel/VBoxContainer
var main_level_label: Label

var category_labels: Dictionary = {}

func _ready():
	_create_category_labels()
	_update_ui()
	
	# Connect signal to update UI on level up
	LevelAndExpManager.level_up.connect(_on_level_up)

func _create_category_labels():
	# Clear existing except MainLevelLabel if dynamically recreating
	for child in container.get_children():
		if child.name != "MainLevelLabel" and child.name != "HSeparator":
			child.queue_free()
	
	# Add Header/Separator if needed (MainLevelLabel is static in scene or created here? let's assume it's created here for safety implementation)
	# Wait, simpler to create everything here since we didn't define exact scene nodes in previous thoughts.
	
	# Clear ALL
	for child in container.get_children():
		child.queue_free()
		
	# Main Level
	main_level_label = Label.new()
	main_level_label.name = "MainLevelLabel"
	main_level_label.text = "Main Level: 1"
	container.add_child(main_level_label)
	
	var sep = HSeparator.new()
	container.add_child(sep)
	
	# Categories
	var categories = LevelAndExpManager.level_and_exp_data.category_data.keys()
	categories.sort()
	
	for cat in categories:
		var hbox = HBoxContainer.new()
		
		var label = Label.new()
		label.name = "Label_" + cat
		label.text = "%s: Lv.1" % cat
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		
		# Test Button (Add EXP)
		var btn = Button.new()
		btn.text = "+Exp"
		btn.pressed.connect(func(): _on_add_exp_pressed(cat))
		
		hbox.add_child(label)
		hbox.add_child(btn)
		
		container.add_child(hbox)
		category_labels[cat] = label

func _update_ui():
	# Update Main Level
	var main_lvl = LevelAndExpManager.get_main_level()
	if main_level_label:
		main_level_label.text = "Main Level: %d" % main_lvl
		
	# Update Categories
	for cat in category_labels:
		var lvl = LevelAndExpManager.get_level(cat)
		var data = LevelAndExpManager.level_and_exp_data.category_data[cat]
		var exp_curr = data["experience"]
		var exp_req = data["required_experience"]
		
		# Format: "Farming: Lv.5 (300/1000)"
		category_labels[cat].text = "%s: Lv.%d (%d/%d)" % [cat, lvl, exp_curr, exp_req]

func _on_add_exp_pressed(category: String):
	LevelAndExpManager.add_experience(category, 50)
	_update_ui() # Manual update instant feedback (signal also handles it but this is snappier for accumulated local changes if any)

func _on_level_up(category, level, req_exp):
	_update_ui()
