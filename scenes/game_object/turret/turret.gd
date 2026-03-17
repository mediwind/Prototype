extends CharacterBody2D

@onready var auto_attack_component = $AutoAttackComponent

var is_preview: bool = false # 미리보기 상태인지 여부


func _ready():
    if is_preview:
        set_preview_mode()
        return
    # 나머지 자동공격 관련 초기화는 AutoAttackComponent에서 처리


func set_preview_mode():
    if has_node("AttackRange"):
        $AttackRange.monitoring = false
        $AttackRange.set_deferred("monitorable", false)
    if has_node("CollisionShape2D"):
        $CollisionShape2D.disabled = true
    if has_node("ShootCooltime"):
        $ShootCooltime.stop()
    if has_node("AudioStreamPlayer"):
        $AudioStreamPlayer.stop()


func _process(_delta):
    auto_attack_component.auto_attack(self)