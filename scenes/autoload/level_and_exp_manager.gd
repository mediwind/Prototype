extends Node

signal level_up(category: String, level: int, required_exp: int)

var level_and_exp_data: LevelAndExpData


func _ready():
	if SaveManager.game_data.level_and_exp_data == null:
		SaveManager.game_data.level_and_exp_data = LevelAndExpData.new()
	level_and_exp_data = SaveManager.game_data.level_and_exp_data
	
	# Validate default categories existence (for migration safety)
	var defaults = ["Farming", "Combat", "Mining", "Fishing", "Foraging"]
	for cat in defaults:
		if not level_and_exp_data.category_data.has(cat):
			level_and_exp_data.category_data[cat] = {"level": 1, "experience": 0, "required_experience": 100}


func add_experience(category: String, amount: int):
	if not level_and_exp_data.category_data.has(category):
		print("LevelAndExpManager: New category detected '%s'. Initializing..." % category)
		level_and_exp_data.category_data[category] = {"level": 1, "experience": 0, "required_experience": 100}
		
	var data = level_and_exp_data.category_data[category]
	data["experience"] += amount
	
	check_and_level_up(category, data)
	# SaveManager.save_game_data()


func check_and_level_up(category: String, data: Dictionary):
	# data reflects the inner dictionary for that category
	var leveled_up = false
	
	while data["experience"] >= data["required_experience"]:
		data["experience"] -= data["required_experience"]
		data["level"] += 1
		# Curve: Simple scaling (1.5x previous req? or flatter? Let's stick to 1.5 for now or 1.2 for smoother curve)
		# Stardew is exponential but let's keep it simple.
		data["required_experience"] = int(data["required_experience"] * 1.5)
		
		leveled_up = true
		SkillManager.add_skill_point(1) # Global skill points? or Category specific?
		# Rules say "SkillManager" manages skill points. Usually skill points are generic or specific?
		# For now, generic skill points.
		
	if leveled_up:
		level_up.emit(category, data["level"], data["required_experience"])
		print("Level up! Category: %s, Level: %d, Next Req: %d" % [category, data["level"], data["required_experience"]])


func get_level(category: String) -> int:
	if level_and_exp_data.category_data.has(category):
		return level_and_exp_data.category_data[category]["level"]
	return 1


func get_main_level() -> int:
	var total_level_sum = 0
	var count = 0
	
	for cat in level_and_exp_data.category_data:
		var lvl = level_and_exp_data.category_data[cat]["level"]
		total_level_sum += lvl
		count += 1
		
	# Formula: Simple average or specific scaling?
	# User requested "Skyrim-like" (skills contribute to main level).
	# Simple implementation: Sum of (Level - 1) of all skills = Main XP?
	# Or explicit formula: floor(Total Levels / 2) + 1 as discussed.
	# Example: 5 Skills at Lv 1 (Total 5). Main = floor(5/2) + 1 = 3.
	
	if count == 0: return 1
	return int(floor(total_level_sum / 2.0)) + 1