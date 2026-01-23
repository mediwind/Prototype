extends PanelContainer

@onready var recipe_list = %RecipeList
@onready var ingredients_grid = $VBoxContainer/HBoxContainer2/VBoxContainer2/GridContainer
@onready var results_grid = $VBoxContainer/HBoxContainer2/VBoxContainer2/GridContainer2
@onready var craft_button = $VBoxContainer/HBoxContainer2/VBoxContainer2/CraftButton

# Preload DisplaySlot instead of interactive Slot
const DISPLAY_SLOT_SCENE = preload("res://scenes/ui/crafting/display_slot.tscn")

var all_recipes: Array[Recipe] = []
var table_types: Array[String] = []

# Currently selected recipe
var selected_recipe: Recipe = null

func _ready():
	# Connect signals
	recipe_list.item_selected.connect(_on_recipe_selected)
	craft_button.pressed.connect(_on_craft_button_pressed)
	
	# Initial UI State
	craft_button.disabled = true
	_clear_grids()
	
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
					# print("Loaded recipe: " + recipe.name)
			file_name = dir.get_next()
		dir.list_dir_end()


func show_recipes_for_table_types():
	recipe_list.clear()
	# print("table_types for UI:", table_types)
	
	for i in range(all_recipes.size()):
		var recipe = all_recipes[i]
		var is_matching = false
		
		for t in table_types:
			if t in recipe.table_types:
				is_matching = true
				break
		
		if is_matching:
			recipe_list.add_item(recipe.name)
			# Store the actual recipe index or reference as metadata if needed
			# For now, we finding it by index in filtered list is risky if we don't store map.
			# Better approach: Store recipe in metadata
			var item_idx = recipe_list.get_item_count() - 1
			recipe_list.set_item_metadata(item_idx, recipe)


func _on_recipe_selected(index: int):
	selected_recipe = recipe_list.get_item_metadata(index) as Recipe
	_update_crafting_preview()


func _update_crafting_preview():
	if not selected_recipe:
		_clear_grids()
		craft_button.disabled = true
		return

	_clear_grids()
	
	var can_craft = true
	
	# 1. Populate Ingredients
	for ingredient in selected_recipe.ingredients:
		var slot = DISPLAY_SLOT_SCENE.instantiate()
		ingredients_grid.add_child(slot)
		
		if ingredient.type == "item" and ingredient.item_data:
			slot.item_data = ingredient.item_data
			slot.amount = ingredient.amount
			
			# Check Inventory
			var has_enough = InventoryManager.has_item(ingredient.item_data, ingredient.amount)
			if not has_enough:
				can_craft = false
				slot.modulate = Color(1, 0.5, 0.5) # Red tint if missing
			else:
				slot.modulate = Color.WHITE
				
		elif ingredient.type == "currency":
			# TODO: Implement Currency display in DisplaySlot or separate Logic
			# For now, just placeholder or skip
			pass
			
	# 2. Populate Results & Check Space
	for output in selected_recipe.output_items:
		var slot = DISPLAY_SLOT_SCENE.instantiate()
		results_grid.add_child(slot)
		
		if output.type == "item" and output.item_data:
			slot.item_data = output.item_data
			slot.amount = output.amount
			
			# Check if we have space for this output
			if not InventoryManager.can_add_item(output.item_data, output.amount):
				can_craft = false
				slot.modulate = Color(1, 0.5, 0.5) # Warning color? Or just disable button
			
	craft_button.disabled = not can_craft


func _clear_grids():
	for child in ingredients_grid.get_children():
		child.queue_free()
	for child in results_grid.get_children():
		child.queue_free()


func _on_craft_button_pressed():
	if not selected_recipe:
		return
		
	# Re-verify requirements (Data integrity check)
	var verify_check = true
	
	# 1. Check Ingredients
	for ingredient in selected_recipe.ingredients:
		if ingredient.type == "item":
			if not InventoryManager.has_item(ingredient.item_data, ingredient.amount):
				verify_check = false
				break
				
	# 2. Check Space (Critical Fix)
	for output in selected_recipe.output_items:
		if output.type == "item":
			if not InventoryManager.can_add_item(output.item_data, output.amount):
				verify_check = false
				print("CraftingUI: Not enough space for output.")
				break
				
	if not verify_check:
		# Refresh UI to show red/disabled state
		_update_crafting_preview()
		return
	
	# Execute Crafting
	# 1. Consume Ingredients
	for ingredient in selected_recipe.ingredients:
		if ingredient.type == "item":
			var success = InventoryManager.consume_item(ingredient.item_data, ingredient.amount)
			if not success:
				print("CraftingUI: Failed to consume ingredient despite check. Critical Error.")
				return

	# 2. Grant Results
	for output in selected_recipe.output_items:
		if output.type == "item":
			InventoryManager.add_item(output.item_data, output.amount)
			print("CraftingUI: Crafted %s x%d" % [output.item_data.name, output.amount])
			
	# 3. Refresh UI
	_update_crafting_preview()


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		queue_free()
		get_tree().paused = false
