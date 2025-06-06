extends Resource
class_name RecipeIngredient

@export var type: String # "item", "currency", "custom" 등
@export var item_data: ItemData
@export var currency_data: CurrencyData
@export var amount: int = 1