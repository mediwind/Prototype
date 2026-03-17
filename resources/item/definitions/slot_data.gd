extends Resource
class_name SlotData

@export var saved_item_id: String = ""

# item_data is NOT exported to prevent ResourceSaver from saving the file path.
# It is reconstructed from saved_item_id during load.
var item_data: ItemData = null:
	set(value):
		item_data = value
		if item_data:
			saved_item_id = item_data.id
			# print("SlotData: Set item %s -> ID: %s" % [item_data.name, saved_item_id])
		else:
			saved_item_id = ""

@export var amount: int = 0
@export var quality: int = 0 # 0: Normal, 1: Silver, 2: Gold, etc.

func try_load_item_from_id() -> void:
	if not item_data and not saved_item_id.is_empty():
		if ItemDatabase:
			item_data = ItemDatabase.get_item(saved_item_id)
		else:
			push_error("SlotData: ItemDatabase not accessible")