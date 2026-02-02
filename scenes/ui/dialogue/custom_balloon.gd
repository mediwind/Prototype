extends CanvasLayer

## The resource to use for the dialogue
var resource: Resource

## The temporary game states to use for the dialogue
var temporary_game_states: Array = []

## See [game_states]
var is_waiting_for_input: bool = false
var is_input_cooldown: bool = false # Prevent accidental skips

## UI Nodes
@onready var balloon: Control = $Balloon
@onready var portrait_rect: TextureRect = $Balloon/Content/Portrait
@onready var character_label: Label = $Balloon/Content/VBox/CharacterLabel
@onready var dialogue_label: RichTextLabel = $Balloon/Content/VBox/DialogueLabel
@onready var responses_menu: VBoxContainer = $Balloon/Responses

## The current line
var dialogue_line: Variant:
	set(next_line):
		is_input_cooldown = true # Lock input momentarily when line changes
		is_waiting_for_input = false
		
		# Clean up if no next line
		if not next_line:
			_end_dialogue()
			return

		dialogue_line = next_line
		
		# Validates if the dialogue line is valid
		if not is_instance_valid(balloon):
			_end_dialogue()
			return

		# Update UI
		character_label.visible = not dialogue_line.character.is_empty()
		character_label.text = tr(dialogue_line.character, "dialogue")
		
		# Portrait Logic (Tag based)
		_update_portrait(dialogue_line)

		# Dialogue Text
		dialogue_label.hide()
		dialogue_label.dialogue_line = dialogue_line
		
		# Responses
		for child in responses_menu.get_children():
			child.queue_free()

		# Show balloon
		balloon.show()
		
		# Start Typing
		dialogue_label.show()
		if not dialogue_line.text.is_empty():
			dialogue_label.type_out()
			await dialogue_label.finished_typing
		
		# MANDATORY DELAY: Prevent accidental skips (Input Cooldown)
		# Use process_always=true because game is paused
		# checking process_always arg: create_timer(time, process_always, process_in_physics, ignore_time_scale)
		await get_tree().create_timer(0.1, true, false, true).timeout
		
		# Unlock input after delay
		is_input_cooldown = false
		
		# Wait for input if there are no responses
		if dialogue_line.responses.size() > 0:
			balloon.focus_mode = Control.FOCUS_NONE
			responses_menu.show()
			for response in dialogue_line.responses:
				# Check if response is allowed
				if response.is_allowed:
					var button = Button.new()
					button.text = response.text
					button.connect("pressed", func(): _on_response_selected(response))
					responses_menu.add_child(button)
			
			# Focus first response
			if responses_menu.get_child_count() > 0:
				responses_menu.get_child(0).grab_focus()
		else:
			is_waiting_for_input = true
			balloon.focus_mode = Control.FOCUS_ALL
			balloon.grab_focus()


func _ready() -> void:
	# PAUSE GAME WORLD
	# Important: This node must be set to "Process Mode: Always" in Inspector or code
	# Since this is a CanvasLayer, we specifically set this script's processing.
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	
	# Hide HUD for cinematic look
	if UIManager:
		UIManager.set_hud_visible(false)
	
	balloon.hide()


func _end_dialogue() -> void:
	get_tree().paused = false
	
	# Restore HUD
	if UIManager:
		UIManager.set_hud_visible(true)
		
	queue_free()


func start(dialogue_resource: Resource, title: String, extra_game_states: Array = []) -> void:
	self.resource = dialogue_resource
	self.temporary_game_states = extra_game_states
	self.dialogue_line = await DialogueManager.get_next_dialogue_line(resource, title, temporary_game_states)


## Advance to the next line
func next(next_id: String) -> void:
	self.dialogue_line = await DialogueManager.get_next_dialogue_line(resource, next_id, temporary_game_states)


## Input Handling
func _unhandled_input(_event: InputEvent) -> void:
	# Only handle input if we are waiting for it and not typing
	pass

func _on_balloon_gui_input(event: InputEvent) -> void:
	if is_input_cooldown: return

	# Click to advance or skip
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if dialogue_label.is_typing:
			dialogue_label.skip_typing()
		elif is_waiting_for_input:
			next(dialogue_line.next_id)
		elif dialogue_line.responses.size() == 0 and not is_waiting_for_input:
			# Safety catch
			pass
			
	if event.is_action_pressed("ui_accept"):
		if dialogue_label.is_typing:
			dialogue_label.skip_typing()
		elif is_waiting_for_input:
			next(dialogue_line.next_id)


func _on_response_selected(response: Variant) -> void:
	next(response.next_id)


# Placeholder for Portrait Logic
func _update_portrait(line: Variant):
	if line.tags.size() > 0:
		pass
