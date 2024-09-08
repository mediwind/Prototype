extends TextureButton
class_name SkillNode


@onready var panel = $Panel
@onready var label = $MarginContainer/Label
@onready var line_2d = $Line2D

@export var skill_template: SkillTemplate

var level : int = 0:
    set(value):
        level = value
        label.text = str(level) + "/" + str(skill_template.max_level)


func _ready():
    self.pressed.connect(_on_pressed)

    if get_parent() is SkillNode:
        line_2d.add_point(global_position + size / 2)
        line_2d.add_point(get_parent().global_position + size / 2)

    level = SkillManager.get_skill_level(skill_template.id)
    label.text = str(level) + "/" + str(skill_template.max_level)

    if level > 0:
        activate_skill_button()


func _on_pressed():
    if level < skill_template.max_level and SkillManager.use_skill_point(skill_template.id):
        level = min(level + 1, skill_template.max_level)
        activate_skill_button()


func activate_skill_button():
    panel.show_behind_parent = true
    line_2d.default_color = Color(1, 1, 0.247)

    var skills = get_children()
    for skill in skills:
        if skill is SkillNode and level >= 1:
            skill.disabled = false