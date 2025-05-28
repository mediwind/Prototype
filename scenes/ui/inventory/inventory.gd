extends Control

@export var slot_scene: PackedScene

@onready var grid_container = $InventoryUI/GridContainer


func _ready():
    var items = InventoryManager.get_items()
    for slot_data in items:
        var slot = slot_scene.instantiate()
        slot.item_data = slot_data.item_data
        slot.amount = slot_data.amount
        grid_container.add_child(slot)
        if slot_data.item_data:
            print("Added item to inventory: ", slot_data.item_data.name, " x", slot_data.amount)


func _input(event):
	# when the player presses the escape key, unpause the game and remove the skill tree
    if event is InputEventKey and event.keycode == KEY_ESCAPE:
        get_tree().paused = false
        queue_free()
