extends Node

# Signals
signal time_updated(datetime_dict) # Emitted every in-game minute
signal minute_passed
signal hour_passed
signal day_started # Emitted at 00:00 (Date change)
signal day_passed # Emitted at 06:00 (Logic tick for crops/respawn)
signal season_changed(new_season)
signal year_changed(new_year)

# Enums
enum Season {SPRING, SUMMER, FALL, WINTER}

# Constants
const MINUTES_PER_HOUR = 60
const HOURS_PER_DAY = 24
const DAYS_PER_SEASON = 28
const SEASONS_PER_YEAR = 4
const LOGIC_TICK_HOUR = 6 # 06:00 AM

# Configuration
# 1 real second = 1 game minute (Default)
# 24 real minutes = 1 game day
var time_scale: float = 60.0
# Calnedar Time Multiplier: Affects day/season progression only. 0.0 = Time Paused (Indoors).
var calendar_time_multiplier: float = 1.0
var is_paused: bool = false

# Current State
var current_year: int = 1
var current_season: int = Season.SPRING
var current_day: int = 1
var current_hour: int = 6 # Start at 06:00
var current_minute: int = 0
var accumulated_time: float = 0.0

func _ready() -> void:
	# Initialize state if needed, or wait for load_save_data
	pass

func reset_time() -> void:
	current_year = 1
	current_season = Season.SPRING
	current_day = 1
	current_hour = 6
	current_minute = 0
	accumulated_time = 0.0
	calendar_time_multiplier = 1.0 # Reset to normal speed
	is_paused = false
	_emit_time_update()
	print("[TimeManager] Time Reset to Default")


func _process(delta: float) -> void:
	if is_paused:
		return
		
	# Apply both Time Scale (Config) and Calendar Multiplier (Scene Context)
	accumulated_time += delta * time_scale * calendar_time_multiplier
	
	if accumulated_time >= 1.0:
		var minutes_to_add = int(accumulated_time)
		accumulated_time -= minutes_to_add
		_advance_time(minutes_to_add)


func set_calendar_time_multiplier(multiplier: float) -> void:
	calendar_time_multiplier = multiplier
	print("[TimeManager] Calendar Time Multiplier set to: ", multiplier)


func _advance_time(minutes_to_add: int) -> void:
	current_minute += minutes_to_add
	
	# Process Minutes
	if current_minute >= MINUTES_PER_HOUR:
		var hours_to_add = current_minute / MINUTES_PER_HOUR
		current_minute = current_minute % MINUTES_PER_HOUR
		
		minute_passed.emit()
		_advance_hours(hours_to_add)
	else:
		minute_passed.emit()
		
	_emit_time_update()

func _advance_hours(hours_to_add: int) -> void:
	for i in range(hours_to_add):
		current_hour += 1
		
		# Check Logic Tick (06:00)
		if current_hour == LOGIC_TICK_HOUR:
			day_passed.emit()
			print("[TimeManager] Logic Tick (06:00) - Day Passed Signal Emitted")
			
		# Check Date Change (24:00 -> 00:00)
		if current_hour >= HOURS_PER_DAY:
			current_hour = 0
			_advance_day()
			
		hour_passed.emit()

func _advance_day() -> void:
	current_day += 1
	day_started.emit()
	print("[TimeManager] Day Started: Year %d, Season %d, Day %d" % [current_year, current_season, current_day])
	
	if current_day > DAYS_PER_SEASON:
		current_day = 1
		_advance_season()

func _advance_season() -> void:
	current_season += 1
	if current_season >= SEASONS_PER_YEAR:
		current_season = Season.SPRING
		_advance_year()
	
	season_changed.emit(current_season)
	print("[TimeManager] Season Changed: %d" % current_season)

func _advance_year() -> void:
	current_year += 1
	year_changed.emit(current_year)
	print("[TimeManager] Year Changed: %d" % current_year)

func _emit_time_update() -> void:
	var time_dict = {
		"year": current_year,
		"season": current_season,
		"day": current_day,
		"hour": current_hour,
		"minute": current_minute
	}
	time_updated.emit(time_dict)

# --- Persistence ---
func get_save_data() -> Dictionary:
	return {
		"year": current_year,
		"season": current_season,
		"day": current_day,
		"hour": current_hour,
		"minute": current_minute
	}

func load_save_data(data: Dictionary) -> void:
	current_year = data.get("year", 1)
	current_season = data.get("season", Season.SPRING)
	current_day = data.get("day", 1)
	current_hour = data.get("hour", 6)
	current_minute = data.get("minute", 0)
	accumulated_time = 0.0
	_emit_time_update()
	print("[TimeManager] Loaded time: Y%d S%d D%d %02d:%02d" % [current_year, current_season, current_day, current_hour, current_minute])
