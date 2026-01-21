extends Node2D
class_name ActionVisualEffect

func play(data: WeaponData, start_pos: Vector2, direction: Vector2):
	if data.is_procedural_visual:
		_play_procedural(data, start_pos, direction)
	elif data.visual_scene:
		_play_scene(data, start_pos, direction)

func _play_procedural(data: WeaponData, start_pos: Vector2, direction: Vector2):
	var polygon = Polygon2D.new()
	add_child(polygon)
	
	var color = data.visual_color
	color.a = 0.6 # Default transparency
	polygon.color = color
	
	# Calculate Arc Points
	var range_pixels = data.attack_range * 16.0 # Assuming 16px tiles
	var angle_rad = deg_to_rad(data.arc_angle)
	var half_angle = angle_rad / 2.0
	var base_angle = direction.angle()
	
	var points = PackedVector2Array()
	points.append(Vector2.ZERO) # Origin
	
	var segments = 10
	for i in range(segments + 1):
		var theta = base_angle - half_angle + (angle_rad * (float(i) / segments))
		points.append(Vector2(cos(theta), sin(theta)) * range_pixels)
		
	polygon.polygon = points
	polygon.global_position = start_pos
	
	# Tween
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(polygon, "modulate:a", 0.0, 0.25).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(polygon, "scale", Vector2(1.1, 1.1), 0.25)
	
	await tween.finished
	queue_free()

func _play_scene(data: WeaponData, start_pos: Vector2, direction: Vector2):
	var instance = data.visual_scene.instantiate()
	add_child(instance)
	instance.global_position = start_pos
	instance.rotation = direction.angle()
	
	# Assume scene frees itself or we wait
	if instance.has_signal("finished"):
		await instance.finished
	else:
		await get_tree().create_timer(0.5).timeout
	
	if is_instance_valid(instance):
		instance.queue_free()
	queue_free()
