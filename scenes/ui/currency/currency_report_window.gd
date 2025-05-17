extends Control

signal report_confirmed

@onready var vbox = $PanelContainer/VBoxContainer
@onready var confirm_button = $PanelContainer/VBoxContainer/Button

var count_speed := 0.001  # 카운트업 속도(초당 증가 단위, 필요시 조정)


func _ready():
    # Button 클릭 시 _on_Button_pressed() 함수 호출
    confirm_button.pressed.connect(_on_Button_pressed)


func show_report(currency_dict: Dictionary):
    # 기존 항목(화폐 HBox) 모두 제거, Button만 남기기
    for child in vbox.get_children():
        if child != confirm_button:
            child.queue_free()

    # Button 비활성화
    confirm_button.disabled = true

    # 화폐별로 HBox 생성 및 카운트업 시작
    var tweens = []
    for currency_name in currency_dict.keys():
        var amount = currency_dict[currency_name]
        var hbox = HBoxContainer.new()

        # 아이콘
        var icon = TextureRect.new()
        icon.texture = CurrencyManager.currencies[currency_name]["icon"]
        icon.custom_minimum_size = Vector2(32, 32)

        # 라벨
        var label = Label.new()
        label.text = "0"
        label.name = "AmountLabel"

        hbox.add_child(icon)
        hbox.add_child(label)
        vbox.add_child(hbox)

        # Tween으로 카운트업 애니메이션
        var tween = create_tween()
        tween.tween_property(label, "text", str(amount), max(0.5, amount * count_speed)).set_trans(Tween.TRANS_LINEAR)
        tweens.append(tween)

    # 모든 Tween 완료 후 버튼 활성화
    if tweens.size() > 0:
        tweens[-1].finished.connect(_on_countup_finished)
    else:
        confirm_button.disabled = false


func _on_countup_finished():
    confirm_button.disabled = false


func _on_Button_pressed():
    report_confirmed.emit()
    queue_free()