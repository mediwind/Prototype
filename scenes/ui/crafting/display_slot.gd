extends Panel

# 아이콘 및 수량 표시를 위한 노드
@onready var icon_rect: TextureRect = $Icon
@onready var amount_label: Label = $Amount
@onready var quality_star: TextureRect = $QualityStar

# 데이터
var item_data: ItemData = null:
	set(value):
		item_data = value
		_update_icon_display()

var amount: int = 0:
	set(value):
		amount = value
		_update_amount_display()

var quality: int = 0:
	set(value):
		quality = value
		_update_quality_display()

const QUALITY_SHEET = preload("res://assets/ui/icons/quality_stars.png")
const STAR_SIZE = 16

func _ready():
	_update_icon_display()
	_update_amount_display()
	_update_quality_display()

func _update_icon_display():
	if not is_inside_tree(): return
	if not icon_rect: return

	if item_data and item_data.icon:
		icon_rect.texture = item_data.icon
		icon_rect.visible = true
	else:
		icon_rect.texture = null
		icon_rect.visible = false

func _update_amount_display():
	if not is_inside_tree(): return
	if not amount_label: return

	if item_data and amount > 0:
		amount_label.text = str(amount)
		amount_label.visible = true
	else:
		amount_label.text = ""
		amount_label.visible = false

func _update_quality_display():
	if not quality_star: return
	
	if quality <= 0:
		quality_star.texture = null
		quality_star.visible = false
		return
		
	var atlas = AtlasTexture.new()
	atlas.atlas = QUALITY_SHEET
	
	var index = quality - 1
	if index < 0: index = 0
	
	atlas.region = Rect2(index * STAR_SIZE, 0, STAR_SIZE, STAR_SIZE)
	quality_star.texture = atlas
	quality_star.visible = true
