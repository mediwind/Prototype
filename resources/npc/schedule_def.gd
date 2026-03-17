class_name ScheduleDef
extends Resource

# Dictionary mapping hour (0-23) to an Activity ID (String).
# Example: { 6: "plaza", 18: "home" }
# The NPC will maintain the last triggered activity until a# Key: hour (int), Value: activity_id (String)
@export var entries: Dictionary[int, String] = {}

@export var default_activity: String = "home"
