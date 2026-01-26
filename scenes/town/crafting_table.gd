extends Area2D

@export var crafting_ui_scene: PackedScene
@export var table_types: Array[String] = ["alchemy"] # Used by CraftingUI

# Interaction Method called by Town.gd via Raycast/Click
func interact(_user: Node2D) -> Variant:
	show_crafting_ui()
	return true # Return true to indicate interaction handled (stops propagation)

func show_crafting_ui():
	if crafting_ui_scene:
		var crafting_ui = crafting_ui_scene.instantiate()
		# Pass types before add_child to ensure _ready has data
		crafting_ui.table_types = table_types

		var root = get_tree().get_root()
		# Try to find TownUI context
		# Better: Pass TownUI via _user or find specific group?
		# Fallback to absolute path or root matching current logic
		var town_ui = root.get_node_or_null("Town/TownUI")

		if town_ui:
			town_ui.add_child(crafting_ui)
		else:
			root.add_child(crafting_ui)

		get_tree().paused = true # Pause game logic while UI is open
