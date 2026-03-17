extends Control

@export var skill_tree_scenes: Array[PackedScene] # PackedScene 들을 인스펙터에 드래그
@onready var tab_container: TabContainer = $TabContainer

func _ready():
	if skill_tree_scenes.is_empty():
		var default_path := "res://scenes/ui/skill/skill_trees/basic_skill_tree_ui.tscn"
		var p := ResourceLoader.load(default_path)
		if p:
			_add_tree_instance(p, "basic_skill_tree_ui")
			_add_tree_instance(p, "basic_skill_tree_ui_copy")
	else:
		for i in skill_tree_scenes.size():
			var p: PackedScene = skill_tree_scenes[i]
			var tree_name := p.resource_path.get_file().get_basename() if p.resource_path != "" else "SkillTree_%d" % i
			_add_tree_instance(p, tree_name)

	tab_container.tab_changed.connect(_on_tab_changed)
	call_deferred("_on_tab_changed", tab_container.current_tab)


func _add_tree_instance(packed_scene: PackedScene, tab_name: String) -> void:
	if not packed_scene:
		return
	var inst = packed_scene.instantiate()
	inst.name = tab_name
	tab_container.add_child(inst)
	tab_container.set_tab_title(tab_container.get_tab_count() - 1, tab_name)

	if inst is Control:
		inst.anchor_left = 0
		inst.anchor_top = 0
		inst.anchor_right = 1
		inst.anchor_bottom = 1
		inst.offset_left = 0
		inst.offset_top = 0
		inst.offset_right = 0
		inst.offset_bottom = 0

	if inst.has_method("build_prerequisite_lines"):
		inst.call_deferred("build_prerequisite_lines")


# 새로 추가: 탭 전체 UI에서 ESC 처리
func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE and event.is_pressed() and not event.is_echo():
		get_tree().paused = false
		get_viewport().set_input_as_handled()
		queue_free() # TabbedSkillTreeUI 자체를 제거하면 자식도 제거됨


func _on_tab_changed(tab_index: int) -> void:
	if tab_index < 0 or tab_index >= tab_container.get_child_count():
		return
	var tab_node := tab_container.get_child(tab_index)
	if tab_node.has_method("build_prerequisite_lines"):
		tab_node.call_deferred("build_prerequisite_lines")
	else:
		_call_build_on_buttons(tab_node)


func _call_build_on_buttons(node: Node) -> void:
	for child in node.get_children():
		if child is SkillButton:
			child.call_deferred("build_connection_line")
		else:
			_call_build_on_buttons(child)
