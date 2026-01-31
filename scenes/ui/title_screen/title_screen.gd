extends Control

@onready var new_game_button = %NewGameButton
@onready var continue_button = %ContinueButton
@onready var quit_button = %QuitButton

# @export var first_scene_path: String = "res://scenes/town/town.tscn"
# Since I don't know the exact path of Town, I'll rely on what I saw in file list or ask user.
# Based on file list: d:\Godot\Prototype\scenes\town\town.tscn
const FIRST_SCENE_PATH = "res://scenes/town/town.tscn"

func _ready():
	new_game_button.pressed.connect(on_new_game_pressed)
	continue_button.pressed.connect(on_continue_pressed)
	quit_button.pressed.connect(on_quit_pressed)
	
	_update_buttons()
	# Pause time while in Title Screen
	TimeManager.is_paused = true


func _update_buttons():
	continue_button.disabled = not SaveManager.has_save_file()


func on_new_game_pressed():
	SaveManager.reset_game_data()
	TimeManager.is_paused = false # Resume time
	SceneManager.change_scene(FIRST_SCENE_PATH)


func on_continue_pressed():
	# Load game data first? 
	# Usually SaveManager loads data, and then we switch to the saved scene.
	# But if SaveManager loads data into Singletons (Inventory, etc), we just need to go to the scene.
	# If the save file contains "current_scene", we should go there.
	# For now, let's assume we go to Town and Town restores state, or SaveManager handles it.
	# If SaveManager has 'load_game()', it usually implies loading data.
	SaveManager.load_game()
	TimeManager.is_paused = false # Resume time
	# Check if we should go to a specific scene.
	# If not, default to Town.
	var target_scene = FIRST_SCENE_PATH
	var target_pos = Vector2.INF
	
	if SaveManager.game_data.current_scene_path != "":
		target_scene = SaveManager.game_data.current_scene_path
		target_pos = SaveManager.game_data.player_position
		
	SceneManager.change_scene(target_scene, "", target_pos)


func on_quit_pressed():
	get_tree().quit()
