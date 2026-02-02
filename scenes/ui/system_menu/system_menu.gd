extends CanvasLayer

@onready var resume_button = %ResumeButton
@onready var save_button = %SaveButton
@onready var load_button = %LoadButton
@onready var main_menu_button = %MainMenuButton
@onready var quit_button = %QuitButton

var is_open = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	visible = false
	
	resume_button.pressed.connect(close_menu)
	save_button.pressed.connect(on_save_pressed)
	load_button.pressed.connect(on_load_pressed)
	main_menu_button.pressed.connect(on_main_menu_pressed)
	quit_button.pressed.connect(on_quit_pressed)


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		if is_open:
			close_menu()
		else:
			open_menu()
		get_viewport().set_input_as_handled()


func open_menu():
	is_open = true
	visible = true
	get_tree().paused = true
	
	if UIManager:
		UIManager.set_hud_visible(false)
	
	# Disable Save in Battle to prevent unsafe state persistence
	var current_scene = get_tree().current_scene
	if current_scene and current_scene.scene_file_path.contains("scenes/combat/combat.tscn"):
		save_button.disabled = true
		save_button.text = "No Save in Battle" # Optional feedback
	else:
		save_button.disabled = false
		save_button.text = "Save"


func close_menu():
	is_open = false
	visible = false
	get_tree().paused = false

	if UIManager:
		# Only restore HUD if we are NOT in the Title Screen
		# We can check current scene or just restore it and let TitleScreen's _ready handle it?
		# Title Screen _ready runs on enter. But if we are IN Title Screen and open menu...
		# Wait, does Title Screen have System Menu? Usually ESC in Title Quits or does nothing?
		# User said "ESC를 눌러 ... 띄운 뒤". If they are in Title, they probably shouldn't open System Menu?
		# But if they do, we shouldn't show HUD.
		# Safer: Check if HUD should be visible? 
		# For now, let's restore it. If we are in Title Screen, we shouldn't likely even HAVE System Menu active?
		# Actually user said "타이틀 화면으로 가 'Continue'를 누르면 ... ". 
		# If we quit to title, close_menu() might be called? 
		# on_main_menu_pressed -> close_menu -> Change Scene.
		# If close_menu restores HUD, then Change Scene (Title) loads. 
		# Title._ready hides HUD. So it should be fine.
		UIManager.set_hud_visible(true)


func on_save_pressed():
	if save_button.disabled: return
	SaveManager.save_game()
	# Optional: Show a "Saved!" toast


func on_load_pressed():
	SaveManager.load_game()
	close_menu()
	
	var target_scene = "res://scenes/town/town.tscn"
	var target_pos = Vector2.INF
	
	if SaveManager.game_data.current_scene_path != "":
		target_scene = SaveManager.game_data.current_scene_path
		target_pos = SaveManager.game_data.player_position
	
	# Reload Scene with Position Override (Prevents visual pop)
	await SceneManager.change_scene(target_scene, "", target_pos)


func on_main_menu_pressed():
	close_menu()
	# Assuming main menu scene path, will need to be passed or hardcoded
	SceneManager.change_scene("res://scenes/ui/title_screen/title_screen.tscn")


func on_quit_pressed():
	get_tree().quit()
