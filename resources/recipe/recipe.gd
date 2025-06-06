extends Resource
class_name Recipe

@export var name: String
@export var ingredients: Array[RecipeIngredient] = []
@export var output_items: Array[RecipeIngredient] = []