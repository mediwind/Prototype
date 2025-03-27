extends Control

@onready var grid_container = $PanelContainer/MarginContainer/GridContainer

var labels = {}


func _ready():
    for currency_name in CurrencyManager.currencies.keys():
        add_currency_ui(currency_name)

    # CurrencyManager의 신호 연결
    CurrencyManager.currency_updated.connect(_on_currency_updated)


func add_currency_ui(currency_name: String):
    var currency_data = CurrencyManager.currencies[currency_name]

    # 아이콘 추가
    var icon = TextureRect.new()
    icon.texture = currency_data["icon"]
    icon.expand_mode = TextureRect.EXPAND_FIT_WIDTH_PROPORTIONAL
    icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
    grid_container.add_child(icon)

    # 수량 라벨 추가
    var label = Label.new()
    label.text = str(currency_data["amount"])
    label.name = currency_name + "_amount"
    grid_container.add_child(label)

    labels[currency_name] = label


func _on_currency_updated(currency_name: String, new_amount: int):
    # 해당 화폐의 라벨을 업데이트
    if labels.has(currency_name):
        labels[currency_name].text = str(new_amount)
    else:
        print("Label not found for:", currency_name)