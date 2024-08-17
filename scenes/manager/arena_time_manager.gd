extends Node

signal arena_difficulty_increased(arena_difficulty: int)

const DIFFICULTY_INTERVAL = 5

# @export var end_screen_scene: PackedScene
@export var town_scene: PackedScene

@onready var timer = $Timer

var arena_difficulty = 0


func _ready():
	timer.timeout.connect(on_timer_timeout)


func _process(delta):
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

	# 원래는 end_screen을 클릭하고 마을로 이동하지만, 지금 단계에서는 바로 마을로 이동한다.
	# I want to go to the town scene after the arena ends
	get_tree().change_scene_to_packed(town_scene)