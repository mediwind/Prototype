extends Resource
class_name Recipe

@export var name: String
@export var ingredients: Array[RecipeIngredient] = []
@export var output_items: Array[RecipeIngredient] = []
@export var table_types: Array[String] = ["alchemy"] # 단일 -> 배열로 변경, 예: ["anvil", "alchemy", "furnace"]