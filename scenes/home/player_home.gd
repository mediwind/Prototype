extends Node

func _ready():
	# Indoors: Stop calendar time (0.0) so days don't pass while inside
	if TimeManager:
		TimeManager.set_calendar_time_multiplier(0.0)
