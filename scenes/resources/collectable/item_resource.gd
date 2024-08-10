extends Resource
class_name Item

# @export var item_category_type : Types.ItemCategoryTypes
@export var item_category_type : String # 임시로 String으로 변경
@export var item_name: String#: set = set_item_name
@export var item_identifier: String#: set = set_identifier
@export var item_texture_icon: Texture2D
@export var item_attack_power: int = 0
@export var item_defense_value: int = 0
@export var item_price: float = 0.0
@export var item_special_trait: String
@export var item_effect: String
@export var item_description: String