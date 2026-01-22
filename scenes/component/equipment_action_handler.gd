extends Node2D
class_name EquipmentActionHandler

const ActionVisualEffectScript = preload("res://scenes/ui/action_visual_effect.gd")

func attempt_action(user: Node2D, item: ItemData, target_pos: Vector2) -> Dictionary:
	if not item or not item.equipment_data:
		return {}
	
	var data = item.equipment_data
	if not data:
		return {}
	
	# Direction Calculation
	var direction = (target_pos - user.global_position).normalized()
	
	# Execute based on Type
	if data is WeaponData:
		var weapon = data as WeaponData
		if weapon.attack_type == WeaponData.AttackType.MELEE_ARC or weapon.attack_type == WeaponData.AttackType.MELEE_STAB:
			return _execute_melee(user, weapon, direction)
		elif weapon.attack_type == WeaponData.AttackType.RANGED_PROJECTILE:
			_execute_ranged(user, weapon, target_pos)
			return {"type": "ranged"}
	elif data is ToolData:
		return _execute_tool(user, data as ToolData, target_pos)
	
	return {}

func _execute_tool(user: Node2D, tool: ToolData, target_pos: Vector2) -> Dictionary:
	# Convert Global Position to Grid Coordinates
	# Assuming standard tilemap logic or requesting conversion from World?
	# Better: ActionHandler shouldn't assume generic World structure... 
	# BUT for now, we assume standard 16x16 grid at (0,0).
	var tile_pos = Vector2i(target_pos / 16.0)
	# Handle negative coordinates correctly (floor)
	tile_pos = Vector2i(floor(target_pos.x / 16.0), floor(target_pos.y / 16.0))
	
	var handled = false
	
	match tool.tool_type:
		ToolData.ToolType.HOE:
			# Validating "is_tillable" via TileMap Custom Data
			# We need to access the SoilTileMap or the Ground Layer.
			# Since ActionHandler is a Component, it doesn't know about Town directly.
			# But 'user' is the Player, and Player is in Town.
			# We can try to find the "SoilTileMap" in the user's tree context.
			# Validating "is_tillable" via TileMap Custom Data
			# We try to access the SoilTileMap.
			# IF we are in a non-farming scene (Combat), town or soil_map might be null.
			# But we still want to SWING (Combat).
			var town = user.get_parent()
			var soil_map = null
			if town:
				soil_map = town.get_node_or_null("SoilTileMap")
				
			if soil_map:
				var tile_data = soil_map.get_cell_tile_data(tile_pos)
				if tile_data and tile_data.get_custom_data("is_tillable"):
					handled = FarmManager.till_soil(tile_pos)
					if handled:
						print("ActionHandler: Tilled soil at ", tile_pos)
				else:
					pass
					# print("ActionHandler: Cannot till here.")
			else:
				pass
				# print("ActionHandler: No SoilMap found (Combat Mode?).")

			
			# HOE COMBAT LOGIC (Weak Attack)
			# Defined penalty: Damage 1, Knockback 0
			var tool_stats = {
				"damage": 1.0,
				"knockback_force": 0.0,
				"arc_angle": 90.0,
				"attack_range": 1.0,
				"visual_color": Color.AZURE
			}
			# Execute visual/combat swing regardless of till success
			var mouse_dir = (user.get_global_mouse_position() - user.global_position).normalized()
			var combat_result = _execute_melee_tool_variant(user, tool_stats, mouse_dir)
			
			# Merge results? Or just return the combat result but inject 'handled'?
			combat_result["handled"] = handled
			combat_result["tile_pos"] = tile_pos
			return combat_result
				
		ToolData.ToolType.WATERING_CAN:
			handled = FarmManager.water_soil(tile_pos)
			if handled:
				print("ActionHandler: Watered soil at ", tile_pos)
			
			# WATERING CAN VISUALS (No Combat)
			# Only play the visual effect, do not execute physics query
			var tool_stats = {
				"arc_angle": 45.0, # Narrower spray?
				"attack_range": 1.0,
				"visual_color": Color.AQUA
			}
			# Visual Only Helper
			_execute_visual_only(user, tool_stats, (user.get_global_mouse_position() - user.global_position).normalized())
				
		ToolData.ToolType.SCYTHE:
			# Scythe acts like a Melee Arc weapon but with fixed Tool stats.
			# We construct a "Virtual" WeaponData on the fly OR pass override params.
			# Let's pass override params to _execute_melee?
			# Refactoring _execute_melee to accept overrides is cleaner.
			var tool_stats = {
				"damage": 1.0,
				"knockback_force": 0.0,
				"arc_angle": 120.0,
				"attack_range": 1.5,
				"visual_color": Color.AZURE # Distinct color for tool swing
			}
			# Reuse Melee Logic
			var result = _execute_melee_tool_variant(user, tool_stats, (user.get_global_mouse_position() - user.global_position).normalized())
			return result # Return immediately as it returns dictionary logic

				
	return {
		"type": "tool",
		"handled": handled,
		"tile_pos": tile_pos
	}

func _execute_melee(user: Node2D, weapon: WeaponData, direction: Vector2) -> Dictionary:
	# 1. Visual Feedback
	# We create a temporary node for the effect
	var visual = ActionVisualEffectScript.new()
	# Add to User so the effect follows the player (e.g. swing animation)
	user.add_child(visual)
	visual.play(weapon, user.global_position, direction)
	
	# 2. Physics Query (Hitbox)
	var space_state = user.get_world_2d().direct_space_state
	var query = PhysicsShapeQueryParameters2D.new()
	var shape = CircleShape2D.new()
	
	# Radius = Tile Size * Range
	shape.radius = weapon.attack_range * 16.0
	query.shape = shape
	
	# Mask: User needs to define what they hit. Enemies?
	# Ideally ActionController has a "hit_mask" export or derives from User.
	# If User is Player, Hit Enemy (Layer 8).
	# If User is Enemy, Hit Player (Layer 10? PlayerHitbox? No PlayerHurtbox).
	# Let's hardcode for Player usage first or export.
	var hit_mask = 128 # Layer 8 (EnemyHurtbox) default
	if user.is_in_group("enemy"):
		hit_mask = 512 # Layer 10 (PlayerHurtbox) ?? Layer 10 is 512? (2^9)
	
	query.collision_mask = hit_mask
	
	# Transform: In front of user
	# Offset center by radius/2 to make it a forward lobe? Or centered on player?
	# "Melee Arc" usually implies centered on player but limited by angle.
	# CircleShape is 360.
	# We need to filter by Angle.
	
	query.transform = Transform2D(0, user.global_position)
	query.collide_with_areas = true # CRITICAL: Hurtboxes are Areas!
	
	var results = space_state.intersect_shape(query)
	
	var half_angle_rad = deg_to_rad(weapon.arc_angle / 2.0)
	var look_angle = direction.angle()
	
	for result in results:
		var collider = result["collider"]
		
		# Angle Check (Sector)
		var dir_to_target = (collider.global_position - user.global_position).normalized()
		var angle_to_target = dir_to_target.angle()
		var angle_diff = abs(angle_difference(look_angle, angle_to_target))
		
		if angle_diff <= half_angle_rad:
			_apply_hit(user, weapon, collider, direction)

	return {
		"type": "melee",
		"shape": shape,
		"transform": query.transform,
		"direction": direction,
		"arc_angle": weapon.arc_angle, # Pass angle for sector filtering
		"range": weapon.attack_range
	}

# Variant of Melee execution for Tools (Scythe) that don't have proper WeaponData
func _execute_melee_tool_variant(user: Node2D, stats: Dictionary, direction: Vector2) -> Dictionary:
	# 1. Visual Feedback
	var visual = ActionVisualEffectScript.new()
	user.add_child(visual)
	
	# Create a dummy or struct to pass to visual.play() since it expects WeaponData?
	# Visual.play expects 'weapon' object with .visual_color, .arc_angle, .attack_range.
	# We can pass a Duck-Typed dictionary object? GDScript dicts don't support dot access by default unless we wrap it.
	# Or we make a temporary WeaponData.
	
	var temp_weapon = WeaponData.new()
	temp_weapon.damage = stats.get("damage", 1.0)
	temp_weapon.knockback_force = stats.get("knockback_force", 0.0)
	temp_weapon.arc_angle = stats.get("arc_angle", 90.0)
	temp_weapon.attack_range = stats.get("attack_range", 1.0)
	temp_weapon.visual_color = stats.get("visual_color", Color.WHITE)
	# temp_weapon.attack_type = WeaponData.AttackType.MELEE_ARC
	
	visual.play(temp_weapon, user.global_position, direction)
	
	# 2. Physics Query (Identical logic)
	var space_state = user.get_world_2d().direct_space_state
	var query = PhysicsShapeQueryParameters2D.new()
	var shape = CircleShape2D.new()
	shape.radius = temp_weapon.attack_range * 16.0
	query.shape = shape
	
	var hit_mask = 128
	if user.is_in_group("enemy"): hit_mask = 512
	query.collision_mask = hit_mask
	query.transform = Transform2D(0, user.global_position)
	query.collide_with_areas = true
	
	var results = space_state.intersect_shape(query)
	var half_angle_rad = deg_to_rad(temp_weapon.arc_angle / 2.0)
	var look_angle = direction.angle()
	
	for result in results:
		var collider = result["collider"]
		var dir_to_target = (collider.global_position - user.global_position).normalized()
		var angle_diff = abs(angle_difference(look_angle, dir_to_target.angle()))
		
		if angle_diff <= half_angle_rad:
			_apply_hit(user, temp_weapon, collider, direction)

	return {
		"type": "melee", # Keep it "melee" so Town.gd _check_farming_hit handles it?
		# Actually Town.gd checks melee result.
		"shape": shape,
		"transform": query.transform,
		"direction": direction,
		"arc_angle": temp_weapon.arc_angle,
		"range": temp_weapon.attack_range
	}

func _execute_visual_only(user: Node2D, stats: Dictionary, direction: Vector2):
	var visual = ActionVisualEffectScript.new()
	user.add_child(visual)
	
	var temp_weapon = WeaponData.new()
	temp_weapon.arc_angle = stats.get("arc_angle", 90.0)
	temp_weapon.attack_range = stats.get("attack_range", 1.0)
	temp_weapon.visual_color = stats.get("visual_color", Color.WHITE)
	
	visual.play(temp_weapon, user.global_position, direction)

func _execute_ranged(user: Node2D, weapon: WeaponData, target_pos: Vector2):
	# Delegate to ShooterComponent if available?
	# Or simple instantiation
	if weapon.projectile_scene:
		var projectile = weapon.projectile_scene.instantiate()
		user.get_parent().add_child(projectile) # Add to World
		projectile.global_position = user.global_position
		
		# Setup Bullet logic (Assuming BaseBullet or compatible)
		# Needs to receive WeaponData properties.
		# BaseBullet uses BulletData. 
		# We might need a "WeaponToBulletAdapter" or simply set properties if Duck Typing allows.
		
		if projectile.has_method("initialize_from_weapon"):
			projectile.initialize_from_weapon(weapon, (target_pos - user.global_position).normalized())
		else:
			# Fallback for BaseBullet (requires BulletData)
			# We might need to construct BulletData on the fly?
			pass

func _apply_hit(_user: Node2D, weapon: WeaponData, target: Node2D, force_dir: Vector2):
	# 1. Damage
	if target.has_method("handle_hit"): # Preferred: Handles damage + Float Text
		target.handle_hit(weapon.damage)
	elif target.has_method("damage"): # Fallback Direct call
		target.damage(weapon.damage)
	elif target.owner and target.owner.has_method("damage"):
		target.owner.damage(weapon.damage)
	elif target is Area2D and target.get("health_component"):
		# Fallback if manual property check but no handle_hit method (Unlikely after refactor)
		target.health_component.damage(weapon.damage)
	
	# 2. Knockback
	# Try to find KnockbackComponent on the Body (target.owner usually for Hurtbox)
	var body = target
	if target is Area2D: # Hurtbox
		body = target.owner
	
	if body:
		var kb_component = body.get_node_or_null("KnockbackComponent")
		if kb_component:
			kb_component.apply_impulse(force_dir * weapon.knockback_force)
