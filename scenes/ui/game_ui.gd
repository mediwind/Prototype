extends CanvasLayer

@onready var hud = $HUD
@onready var windows = $Windows
@onready var system_menu = $SystemMenu
@onready var action_bar = $HUD/ActionBar
@onready var currency_display = $HUD/CurrencyDisplay

@onready var skill_btn = $HUD/HBoxContainer/SkillUIButton
@onready var inv_btn = $HUD/HBoxContainer/InventoryUIButton

func _ready():
	# Connect Buttons
	skill_btn.pressed.connect(func(): UIManager.toggle_skill_tree())
	inv_btn.pressed.connect(func(): UIManager.toggle_inventory())
	
	# Initialize Visibility
	hud.visible = true
	windows.visible = true
	system_menu.visible = false

func add_window(window_node: Node):
	windows.add_child(window_node)

func clear_windows():
	for child in windows.get_children():
		child.queue_free()
