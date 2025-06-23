extends PanelContainer

@onready var recipe_list = %RecipeList

var all_recipes: Array[Recipe] = []
var table_types: Array[String] = []


func _ready():
    # CraftingTable에서 table_type을 전달받았다고 가정
    load_all_recipes()
    show_recipes_for_table_types()


func load_all_recipes():
    var dir = DirAccess.open("res://resources/recipe/")
    if dir:
        dir.list_dir_begin()
        var file_name = dir.get_next()
        while file_name != "":
            if file_name.ends_with(".tres"):
                var recipe = load("res://resources/recipe/" + file_name)
                if recipe is Recipe:
                    all_recipes.append(recipe)
                    print("Loaded recipe: " + recipe.name)
            file_name = dir.get_next()
        dir.list_dir_end()


func show_recipes_for_table_types():
    recipe_list.clear()
    print("table_types for UI:", table_types)
    for recipe in all_recipes:
        print("checking recipe:", recipe.name, "with table_types:", recipe.table_types)
        for t in table_types:
            if t in recipe.table_types:
                print("Adding recipe to list:", recipe.name)
                recipe_list.add_item(recipe.name)
                break


func _unhandled_input(event):
    if event.is_action_pressed("ui_cancel"):
        queue_free()
        get_tree().paused = false
