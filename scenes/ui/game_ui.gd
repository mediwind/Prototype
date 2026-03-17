extends CanvasLayer

@onready var hud = $HUD
@onready var windows = $Windows
@onready var system_menu = $SystemMenu
@onready var action_bar = $HUD/ActionBar
@onready var currency_display = $HUD/CurrencyDisplay

@onready var skill_btn = $HUD/HBoxContainer/SkillUIButton
@onready var inv_btn = $HUD/HBoxContainer/InventoryUIButton

@onready var time_label = $HUD/TimeDisplay

func _ready():
	# Connect Buttons
	skill_btn.pressed.connect(func(): UIManager.toggle_skill_tree())
	inv_btn.pressed.connect(func(): UIManager.toggle_inventory())
	
	# Connect TimeManager
	if TimeManager:
		TimeManager.time_updated.connect(_on_time_updated)
	
	# Initialize Visibility
	hud.visible = true
	windows.visible = true
	system_menu.visible = false

func _on_time_updated(time_dict: Dictionary) -> void:
	if not time_label: return
	
	var season_names = ["Spring", "Summer", "Fall", "Winter"]
	var season_str = season_names[time_dict.get("season", 0)]
	var hour = time_dict.get("hour", 6)
	var minute = time_dict.get("minute", 0)
	
	# Format: Y1 Spring 01 06:00
	time_label.text = "Y%d %s %02d %02d:%02d" % [
		time_dict.get("year", 1),
		season_str,
		time_dict.get("day", 1),
		hour,
		minute
	]

func add_window(window_node: Node):
	windows.add_child(window_node)

func clear_windows():
	for child in windows.get_children():
		child.queue_free()
