extends Control

@export var available_buildings: Array[PackedScene]

@onready var button_container = $VBoxContainer


func _ready():
	for building_scene in available_buildings:
		var btn = Button.new()
		btn.text = building_scene.resource_path.get_file().get_basename()
		btn.pressed.connect(func(): on_build_button_pressed(building_scene))
		btn.focus_mode = Control.FOCUS_NONE # 엔터/스페이스 등 키보드 입력으로 버튼이 실행되는 현상 방지 (포커스 비활성화)
		button_container.add_child(btn)


func on_build_button_pressed(scene: PackedScene):
	# Create temporary PlaceableData for the legacy building system
	# This creates a data wrapper on the fly to satisfy the new BuildManager API
	var data = PlaceableData.new()
	data.placeable_scene = scene
	data.id = scene.resource_path.get_file().get_basename()
	data.max_range = 0.0 # Infinite range for combat/test turrets
	
	# Find references in Main scene
	# BuildingUI is in UI (CanvasLayer) -> Main
	var main_node = get_node("../..")
	var tile_map = main_node.get_node("TileMapLayer")
	
	# Use Main node as parent for buildings in combat scene (or find specific container)
	# BuildManager expects Node2D parent. Main is Node. Use tile_map (TileMapLayer is Node2D) as container for now.
	# Turrets are transient (not saved) and should NOT consume hotbar items (UI based)
	# Pass empty callbacks for now (or handle cooldowns/resources later)
	BuildManager.start_placing(data, tile_map, tile_map, true, {})


func _on_cancel_button_pressed():
	BuildManager.cancel_build()
