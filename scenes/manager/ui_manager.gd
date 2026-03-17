extends Node

# Preloaded Scenes
const GAME_UI_SCENE = preload("res://scenes/ui/game_ui.tscn")
const INVENTORY_UI_SCENE = preload("res://scenes/ui/inventory/InventoryUI.tscn")
const SKILL_UI_SCENE = preload("res://scenes/ui/skill/tabbed_skill_tree_ui.tscn")
const QUEST_LOG_SCENE = preload("res://scenes/ui/quest_log/quest_log_ui.tscn")
# context: ChestUI is dynamic, passed in

var game_ui_instance: CanvasLayer = null

# Input Lock
# Input Lock
var is_ui_open: bool = false
var is_dialogue_active: bool = false # Tracks cinematic mode

func _ready():
	# Allow UIManager to work when paused
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Instantiate GameUI
	call_deferred("_setup_game_ui")

func _setup_game_ui():
	if game_ui_instance == null:
		game_ui_instance = GAME_UI_SCENE.instantiate()
		# Add to root (Persistent)
		get_tree().root.add_child(game_ui_instance)
		# Default to Hidden (so Title Screen is clean)
		game_ui_instance.hud.visible = false

func set_hud_visible(visible: bool):
	if game_ui_instance:
		game_ui_instance.hud.visible = visible

func set_dialogue_active(active: bool):
	is_dialogue_active = active
	# We could auto-hide HUD here, but let's keep it explicit in balloon for now
	# or move specific logic here. For now, just tracking state.

func _unhandled_input(event: InputEvent):
	if InputMap.has_action("toggle_inventory") and event.is_action_pressed("toggle_inventory"): # I
		toggle_inventory()
		get_viewport().set_input_as_handled()
	elif InputMap.has_action("toggle_skill_tree") and event.is_action_pressed("toggle_skill_tree"): # K
		toggle_skill_tree()
		get_viewport().set_input_as_handled()
	elif InputMap.has_action("toggle_quest_log") and event.is_action_pressed("toggle_quest_log"): # J
		toggle_quest_log()
		get_viewport().set_input_as_handled()
	elif event.is_action_pressed("ui_cancel"): # Esc
		_handle_escape()
		# Don't consume yet, might be needed for other things? 
		# Actually, if we close a window, we should consume it.
	
	# Debug/Dev keys can remain in other managers for now

# --- Window Management ---

func toggle_inventory():
	if _close_any_open_window("InventoryUI"):
		return
		
	var inv_ui = INVENTORY_UI_SCENE.instantiate()
	_open_window(inv_ui)

func toggle_skill_tree():
	if _close_any_open_window("TabbedSkillTreeUI"): # Check name match
		return
		
	var skill_ui = SKILL_UI_SCENE.instantiate()
	_open_window(skill_ui)

func toggle_quest_log():
	if _close_any_open_window("QuestLogUI"):
		return
		
	var quest_ui = QUEST_LOG_SCENE.instantiate()
	_open_window(quest_ui)

func open_container_ui(data: InventoryData):
	# Close generic windows first
	close_all_windows()
	
	# Instantiate dynamically (circular dependency avoidance if needed)
	var chest_ui_scene = load("res://scenes/ui/inventory/chest_ui.tscn")
	var chest_ui = chest_ui_scene.instantiate()
	game_ui_instance.add_window(chest_ui)
	chest_ui.open(data)
	
	_set_ui_mode(true)

# --- Helper Logic ---

func _open_window(window_node: Node):
	# Close other windows? Or allow stacking? Stacking is complex. Single window for now.
	close_all_windows()
	game_ui_instance.add_window(window_node)
	_set_ui_mode(true)

func close_all_windows():
	if game_ui_instance:
		game_ui_instance.clear_windows()
	_set_ui_mode(false)

func _close_any_open_window(target_name: String = "") -> bool:
	# Returns true if a window was closed
	if not game_ui_instance: return false
	
	var closed = false
	for child in game_ui_instance.windows.get_children():
		if target_name == "" or child.name.begins_with(target_name):
			child.queue_free()
			closed = true
	
	if closed and game_ui_instance.windows.get_child_count() <= 1: # 1 being the one we just deleted
		_set_ui_mode(false)
		
	return closed

func _handle_escape():
	# Priority 1: Close active windows
	if _close_any_open_window():
		get_viewport().set_input_as_handled()
		return
	
	# Priority 2: Open/Close System Menu (Future)
	# ...

func _set_ui_mode(active: bool):
	is_ui_open = active
	get_tree().paused = active
	# Add logic to show/hide mouse cursor if needed
