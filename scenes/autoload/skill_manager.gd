extends Node

signal skill_point_used
signal equipped_skills_changed

var skill_data: SkillData
var skill_cooldowns: Dictionary = {}


func _ready():
	load_save_data()


func load_save_data():
	if SaveManager.game_data.skill_data == null:
		SaveManager.game_data.skill_data = SkillData.new()
	# Refresh Reference
	skill_data = SaveManager.game_data.skill_data
	# Clear volatile runtime state
	skill_cooldowns.clear()
	equipped_skills_changed.emit()


func add_skill_point(amount: int):
	skill_data.skill_points += amount
	# SaveManager.save_game_data()


func use_skill_point(skill_name: String) -> bool:
	if skill_data.skill_points > 0:
		skill_data.skill_points -= 1
		skill_point_used.emit()
		skill_data.acquired_skills[skill_name] = \
			{"quantity": skill_data.acquired_skills.get(skill_name, {"quantity": 0})["quantity"] + 1}
		# SaveManager.save_game_data()
		print(skill_data.acquired_skills)
		return true
	else:
		print("Not enough skill points")
		return false


func reset_skills():
	var refund_points = 0
	for skill_id in skill_data.acquired_skills:
		var quantity = skill_data.acquired_skills[skill_id]["quantity"]
		
		# Load resource to get cost
		var path = "res://resources/skill/" + skill_id + "_skill.tres"
		if not ResourceLoader.exists(path):
			path = "res://resources/skill/" + skill_id + ".tres"
			
		if ResourceLoader.exists(path):
			var tmpl = load(path) as SkillTemplate
			if tmpl:
				refund_points += quantity * tmpl.skill_point_cost
	
	skill_data.skill_points += refund_points
	skill_data.acquired_skills.clear()
	skill_data.equipped_skills.clear()
	
	equipped_skills_changed.emit()
	skill_point_used.emit()


func get_skill_level(skill_name: String) -> int:
	skill_data = SaveManager.game_data.skill_data
	if skill_data.acquired_skills.has(skill_name):
		return skill_data.acquired_skills[skill_name]["quantity"]
	return 0


func has_skill(skill_id: String) -> bool:
	# Checks if the skill is acquired (level > 0)
	return get_skill_level(skill_id) > 0


func equip_skill(slot_index: int, skill_id: String):
	var old_slot = -1
	for slot in skill_data.equipped_skills:
		if skill_data.equipped_skills[slot] == skill_id:
			old_slot = slot
			break
	
	var target_skill_id = skill_data.equipped_skills.get(slot_index)
	
	# Swap Logic
	if old_slot != -1 and target_skill_id != null and old_slot != slot_index:
		skill_data.equipped_skills[old_slot] = target_skill_id
		skill_data.equipped_skills[slot_index] = skill_id
	else:
		# Standard Equip / Move / Overwrite
		if old_slot != -1 and old_slot != slot_index:
			skill_data.equipped_skills.erase(old_slot)
		skill_data.equipped_skills[slot_index] = skill_id

	equipped_skills_changed.emit()
	# SaveManager.save_game_data()


func unequip_skill(slot_index: int):
	if skill_data.equipped_skills.has(slot_index):
		skill_data.equipped_skills.erase(slot_index)
		equipped_skills_changed.emit()
		# SaveManager.save_game_data()


func get_equipped_skill(slot_index: int) -> String:
	return skill_data.equipped_skills.get(slot_index, "")


func trigger_skill(skill_id: String):
	if is_skill_on_cooldown(skill_id):
		print("Skill [", skill_id, "] is on Cooldown!")
		return

	print("Skill [", skill_id, "] triggered!")
	
	# Cooldown Logic
	# Load resource to get cooldown info
	var path = "res://resources/skill/" + skill_id + "_skill.tres"
	if not ResourceLoader.exists(path):
		path = "res://resources/skill/" + skill_id + ".tres"
	
	if ResourceLoader.exists(path):
		var tmpl = load(path) as SkillTemplate
		if tmpl and tmpl.cooldown > 0:
			var end_time = Time.get_ticks_msec() + (tmpl.cooldown * 1000)
			skill_cooldowns[skill_id] = end_time


func is_skill_on_cooldown(skill_id: String) -> bool:
	if not skill_cooldowns.has(skill_id): return false
	return Time.get_ticks_msec() < skill_cooldowns[skill_id]


func get_cooldown_progress(skill_id: String) -> float:
	# Returns remaining time in seconds
	if not is_skill_on_cooldown(skill_id): return 0.0
	var time_left = (skill_cooldowns[skill_id] - Time.get_ticks_msec()) / 1000.0
	return max(0.0, time_left)