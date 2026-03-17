extends Node
class_name HealthComponent

signal died
signal health_changed(current_health: float, change_amount: float)

@export var max_health: float = 10
var current_health: float

func _ready():
	current_health = max_health

func damage(damage_amount: float):
	var previous_health = current_health
	current_health = max(current_health - damage_amount, 0)
	var change = current_health - previous_health
	
	if change != 0:
		health_changed.emit(current_health, change)
		
	Callable(check_death).call_deferred()

func heal(heal_amount: float):
	var previous_health = current_health
	current_health = min(current_health + heal_amount, max_health)
	var change = current_health - previous_health
	
	if change != 0:
		health_changed.emit(current_health, change)

func get_health_percent():
	if max_health <= 0:
		return 0
	return min(current_health / max_health, 1)

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()