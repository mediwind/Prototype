extends Control

@export var skill_tree_scenes: Array[PackedScene] # PackedScene 들을 인스펙터에 드래그
@onready var tab_container: TabContainer = $TabContainer

func _ready():
	# 인스펙터에 씬을 등록하지 않았다면 기본 스킬트리 씬을 두 개 만들어서 테스트
	if skill_tree_scenes.size() == 0:
		var default_path := "res://scenes/ui/skill/skill_tree_ui.tscn"
		var p := load(default_path)
		if p:
			_add_tree_instance(p, "BasicSkillTreeUI")
			_add_tree_instance(p, "BasicSkillTreeUI_Copy")
		else:
			push_error("TabbedSkillTreeUI: 기본 스킬트리 씬을 찾을 수 없음: " + default_path)
		return

	# 인스펙터에 등록된 씬들을 탭으로 인스턴스화
	for i in range(skill_tree_scenes.size()):
		var p = skill_tree_scenes[i]
		var tree_name = "SkillTree_%d" % i
		if p is PackedScene:
			if p.resource_path != "":
				tree_name = p.resource_path.get_file().get_basename()
		_add_tree_instance(p, tree_name)


func _add_tree_instance(packed_scene: PackedScene, tab_name: String) -> void:
	if not packed_scene:
		return
	var inst = packed_scene.instantiate()
	if not inst:
		return
	inst.name = tab_name
	tab_container.add_child(inst) # TabContainer에 자식으로 추가하면 탭이 생김

	# 추가된 탭 인덱스 얻어서 탭 타이틀 설정
	var idx = tab_container.get_tab_count() - 1
	tab_container.set_tab_title(idx, tab_name)

	# Control이면 전체 영역을 채우도록 설정
	if inst is Control:
		inst.anchor_left = 0
		inst.anchor_top = 0
		inst.anchor_right = 1
		inst.anchor_bottom = 1
		# margin_* 대신 offset_* 사용 (tscn에서 보이는 속성과 일치)
		inst.offset_left = 0
		inst.offset_top = 0
		inst.offset_right = 0
		inst.offset_bottom = 0

	# 인스턴스의 후처리 함수가 있으면 deferred로 호출 (예: 라인 생성)
	if inst.has_method("build_prerequisite_lines"):
		inst.call_deferred("build_prerequisite_lines")


# 새로 추가: 탭 전체 UI에서 ESC 처리
func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().paused = false
		queue_free() # TabbedSkillTreeUI 자체를 제거하면 자식도 제거됨
