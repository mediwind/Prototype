extends Node2D
class_name EquipmentActionHandler

const ActionVisualEffectScript = preload("res://scenes/ui/action_visual_effect.gd")

func attempt_action(user: Node2D, item: ItemData, target_pos: Vector2) -> Dictionary:
	if not item or not item.equipment_data:
		return {}
	
	var weapon = item.equipment_data as WeaponData
	if not weapon:
		return {}
	
	# Direction Calculation
	var direction = (target_pos - user.global_position).normalized()
	
	# Execute based on Type
	if weapon.attack_type == WeaponData.AttackType.MELEE_ARC or weapon.attack_type == WeaponData.AttackType.MELEE_STAB:
		return _execute_melee(user, weapon, direction)
	elif weapon.attack_type == WeaponData.AttackType.RANGED_PROJECTILE:
		_execute_ranged(user, weapon, target_pos)
		return {"type": "ranged"}
	
	return {}

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

	# Return Hit Data for External Use (e.g. Farming Grid Check)
	return {
		"type": "melee",
		"shape": shape,
		"transform": query.transform,
		"direction": direction,
		"arc_angle": weapon.arc_angle, # Pass angle for sector filtering
		"range": weapon.attack_range
	}

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
