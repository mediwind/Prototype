extends TextureButton
class_name SkillButton

enum Mode {TREE, ACTION}

@onready var panel = $Panel
@onready var label = $MarginContainer/Label
@onready var line_2d = $Line2D
@onready var cooldown_bar = $CooldownBar
@onready var key_bind_label = $KeyBindLabel

# TREE Mode: Assign via Inspector. ACTION Mode: Assign via Code or DragDrop.
@export var skill_template: SkillTemplate

var current_mode = Mode.TREE
var assigned_key_text: String = ""

# For Tree Mode
var level: int = 0:
	set(value):
		level = value
		if current_mode == Mode.TREE and skill_template:
			label.text = str(level) + "/" + str(skill_template.max_level)

# For Action Mode
var slot_index: int = -1

func _ready():
	add_to_group("skill_button")
	self.pressed.connect(_on_pressed)

	if current_mode == Mode.TREE:
		_setup_tree_mode()
	else:
		_setup_action_mode()

func _process(_delta):
	if current_mode == Mode.ACTION and skill_template:
		var remaining = SkillManager.get_cooldown_progress(skill_template.id)
		if remaining > 0:
			cooldown_bar.max_value = skill_template.cooldown
			cooldown_bar.value = remaining
			cooldown_bar.visible = true
			disabled = true # Prevent click interaction while cooling? Optional, Manager blocks it too.
		else:
			cooldown_bar.visible = false
			disabled = false
	else:
		cooldown_bar.visible = false


func _setup_tree_mode():
	# Hide Action UI
	cooldown_bar.visible = false
	key_bind_label.visible = false
	
	if not skill_template:
		return
		
	# Auto-assign icon from template (QoL)
	if skill_template.icon:
		texture_normal = skill_template.icon
		
	if get_parent() is SkillButton:
		call_deferred("build_connection_line")

	level = SkillManager.get_skill_level(skill_template.id)
	label.text = str(level) + "/" + str(skill_template.max_level)

	if level > 0:
		activate_skill_button()


func _setup_action_mode():
	# Hide Tree UI
	panel.visible = true # Keep panel visible as slot background
	panel.show_behind_parent = true # Draw behind the button texture
	line_2d.visible = false
	label.visible = false # Hide level text
	
	# Show Action UI
	key_bind_label.visible = true
	key_bind_label.text = assigned_key_text
	
	cooldown_bar.visible = true
	cooldown_bar.value = 0
	
	disabled = false
	button_pressed = false
	modulate = Color.WHITE
	toggle_mode = false # Actions are clicks, not toggles
	
	update_visuals_from_data()


func update_visuals_from_data():
	if current_mode != Mode.ACTION: return
	
	if skill_template:
		texture_normal = skill_template.icon
	else:
		texture_normal = null


func set_slot_index(idx: int, key_text: String):
	current_mode = Mode.ACTION
	slot_index = idx
	assigned_key_text = key_text
	
	# Check if data exists for this slot
	var skill_id = SkillManager.get_equipped_skill(slot_index)
	if skill_id != "":
		# Dynamic Resource Loading
		# Naming convention assumption: [id]_skill.tres or [id].tres
		var path = "res://resources/skill/" + skill_id + "_skill.tres"
		if not ResourceLoader.exists(path):
			path = "res://resources/skill/" + skill_id + ".tres"
			
		if ResourceLoader.exists(path):
			skill_template = load(path)
		else:
			push_warning("Skill Action Bar: Resource not found for skill ID: " + skill_id)
			skill_template = null
	else:
		skill_template = null
	
	if is_inside_tree():
		_setup_action_mode()
	
	update_visuals_from_data()


func _on_pressed():
	if current_mode == Mode.TREE:
		if skill_template and level < skill_template.max_level and SkillManager.use_skill_point(skill_template.id):
			level = min(level + 1, skill_template.max_level)
			activate_skill_button()
	
	elif current_mode == Mode.ACTION:
		if skill_template:
			SkillManager.trigger_skill(skill_template.id)
			# TODO: Start Cooldown Visual


func _unhandled_key_input(event):
	if current_mode == Mode.ACTION and skill_template and visible:
		if event.pressed and not event.echo:
			if event.as_text_keycode() == assigned_key_text:
				_on_pressed()
				get_viewport().set_input_as_handled()


# --- Drag & Drop ---

func _get_drag_data(at_position):
	if not skill_template: return null
	
	# Only drag if unlocked (Tree) or equipped (Action)
	if current_mode == Mode.TREE and level <= 0: return null
	
	# Only active skills can be dragged to bar
	if skill_template.skill_type != "active": return null

	var preview = TextureRect.new()
	preview.texture = texture_normal
	preview.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	preview.size = Vector2(40, 40)
	set_drag_preview(preview)
	
	return {"skill_id": skill_template.id}


func _can_drop_data(at_position, data):
	if current_mode != Mode.ACTION: return false
	return data is Dictionary and data.has("skill_id")


func _drop_data(at_position, data):
	var skill_id = data.skill_id
	SkillManager.equip_skill(slot_index, skill_id)
	
	# Update Self (Quick Refresh)
	set_slot_index(slot_index, assigned_key_text)


# --- Tree Mode Helpers ---

func activate_skill_button():
	panel.show_behind_parent = true
	line_2d.default_color = Color(1, 1, 0.247)

	var skills = get_children()
	for skill in skills:
		if skill is SkillButton and level >= 1:
			skill.disabled = false


func retrieve_skill_point():
	if current_mode != Mode.TREE: return
	
	level = 0 # Setter updates label
	
	# Reset Visuals to Locked State
	line_2d.default_color = Color(0.219608, 0.219608, 0.219608, 1)
	panel.show_behind_parent = false # Cover the icon (Dim)
	button_pressed = false
	
	# Disable if child (Parent will unlock me if it has points... wait, reset means everyone 0)
	# So only Root is enabled.
	if get_parent() is SkillButton:
		disabled = true
	else:
		disabled = false


func _notification(what):
	if what == NOTIFICATION_VISIBILITY_CHANGED and is_visible_in_tree():
		if current_mode == Mode.TREE and get_parent() is SkillButton:
			call_deferred("build_connection_line")

	if what == NOTIFICATION_DRAG_END:
		if current_mode == Mode.ACTION and not is_drag_successful():
			# Dragged off and dropped nowhere -> Unequip
			SkillManager.unequip_skill(slot_index)


func build_connection_line():
	if current_mode != Mode.TREE: return
	if not (line_2d and get_parent() is SkillButton):
		return

	line_2d.top_level = true
	var parent_btn := get_parent() as SkillButton
	var start := get_global_position() + size * 0.5
	var finish := parent_btn.get_global_position() + parent_btn.size * 0.5

	line_2d.clear_points()
	line_2d.add_point(start)
	line_2d.add_point(finish)
