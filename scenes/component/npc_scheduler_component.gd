class_name NPCSchedulerComponent
extends Node

@export var items: Dictionary = {} # Optional explicit assignments in editor if needed, but we usually use the Resource
@export var movement_component: NPCMovementComponent

var _schedule: ScheduleDef
var _current_activity_id: String = ""

# Destinations mapping: Activity ID -> Marker2D or Position
# This needs to be populated by the main NPC script or found in the scene
var destinations: Dictionary = {}

func initialize(schedule: ScheduleDef, known_destinations: Dictionary) -> void:
	_schedule = schedule
	destinations = known_destinations
	
	# Connect to TimeManager
	if TimeManager:
		if not TimeManager.hour_passed.is_connected(_on_hour_passed):
			TimeManager.hour_passed.connect(_on_hour_passed)
			
	# Initial check
	check_schedule(TimeManager.current_hour)

func _on_time_updated(_time_dict: Dictionary) -> void:
	pass

func _on_hour_passed() -> void:
	check_schedule(TimeManager.current_hour)

func check_schedule(current_hour: int) -> void:
	if not _schedule:
		return
		
	var new_activity = _get_activity_for_hour(current_hour)
	
	if new_activity != _current_activity_id:
		_change_activity(new_activity)

func _get_activity_for_hour(hour: int) -> String:
	# Iterate backwards from current hour to find the last scheduled event
	# e.g. Schedule { 6: "plaza", 18: "home" }. 
	# If hour is 10, we want "plaza". Use 24h loop logic if needed, but simple fallback is fine.
	# Check exact match
	if _schedule.entries.has(hour):
		return _schedule.entries[hour]
	
	# Find most recent previous entry
	# Simple naive search: hour down to 0, then 23 down to hour+1
	for i in range(hour, -1, -1):
		if _schedule.entries.has(i):
			return _schedule.entries[i]
			
	for i in range(23, hour, -1):
		if _schedule.entries.has(i):
			return _schedule.entries[i]
			
	return _schedule.default_activity

func _change_activity(activity_id: String) -> void:
	print("[Scheduler] Changing activity to: ", activity_id)
	_current_activity_id = activity_id
	
	if destinations.has(activity_id):
		var target_node = destinations[activity_id]
		var target_pos = Vector2.ZERO
		
		if target_node is Node2D:
			target_pos = target_node.global_position
		elif target_node is Vector2:
			target_pos = target_node
			
		if movement_component:
			movement_component.move_to(target_pos)
		else:
			push_warning("Scheduler has no movement component linked!")
	
	# Only warn if destinations dictionary is populated (implying we SHOULD have it)
	# Or just suppress it if we know init() calls check_schedule immediately before populate
	elif not destinations.is_empty():
		push_warning("No destination found for activity: %s" % activity_id)
