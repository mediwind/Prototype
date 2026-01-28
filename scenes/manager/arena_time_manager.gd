extends Node

signal arena_difficulty_increased(arena_difficulty: int)

const DIFFICULTY_INTERVAL = 5

# @export var end_screen_scene: PackedScene
@export var town_scene: PackedScene
@export var currency_report_window_scene: PackedScene

@onready var timer = $Timer

var arena_difficulty = 0


func _ready():
	timer.timeout.connect(on_timer_timeout)


func _process(_delta):
	var next_time_target = timer.wait_time - ((arena_difficulty + 1) * DIFFICULTY_INTERVAL)
	if timer.time_left <= next_time_target:
		arena_difficulty += 1
		arena_difficulty_increased.emit(arena_difficulty)


func get_time_elapsed():
	return timer.wait_time - timer.time_left


func on_timer_timeout():
	# 아레나 시간이 끝났을 때 end_screen이 팝업된다.
	# var end_screen_instance = end_screen_scene.instantiate()
	# add_child(end_screen_instance)
	# end_screen_instance.play_jingle()
	# MetaProgression.save()
	get_tree().paused = true

	var report_window = currency_report_window_scene.instantiate()
	add_child(report_window)
	report_window.show_report(CurrencyManager.battle_currencies)
	CurrencyManager.finalize_battle_rewards()
	report_window.report_confirmed.connect(_on_report_confirmed)


func _on_report_confirmed():
	get_tree().paused = false
	# report_window가 "OK" 버튼을 클릭했을 때 마을로 이동한다.
	SceneManager.change_scene(town_scene.resource_path)