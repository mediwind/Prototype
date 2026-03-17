extends Node

# Dictionary mapping Item ID (String) -> ItemData (Resource)
var _item_registry: Dictionary = {}

func _ready() -> void:
	load_all_items()

func load_all_items() -> void:
	_item_registry.clear()
	print("ItemDatabase: Starting full scan...")
	
	# Recursive scan starting from root item folder
	_scan_directory("res://resources/item/")
	
	print("ItemDatabase: Scan complete. Registered %d items." % _item_registry.size())

func _scan_directory(path: String) -> void:
	var dir = DirAccess.open(path)
	if not dir:
		push_error("ItemDatabase: Failed to open directory: " + path)
		return
		
	dir.list_dir_begin()
	var file_name = dir.get_next()
	
	while file_name != "":
		if dir.current_is_dir():
			if file_name != "." and file_name != "..":
				# Recursively scan subdirectories
				_scan_directory(path.path_join(file_name))
		else:
			if file_name.ends_with(".tres"):
				_register_item(path.path_join(file_name))
				
		file_name = dir.get_next()

func _register_item(file_path: String) -> void:
	var resource = ResourceLoader.load(file_path)
	if not resource is ItemData:
		return
		
	var item = resource as ItemData
	
	# Skip if no ID is set (User hasn't migrated yet)
	if item.id.is_empty():
		push_warning("ItemDatabase: Item has no ID, skipping: " + file_path)
		return
		
	if _item_registry.has(item.id):
		push_error("ItemDatabase: Duplicate ID detected! '%s' in %s (Already registered)" % [item.id, file_path])
		return
		
	_item_registry[item.id] = item
	# print("ItemDatabase: Registered '%s'" % item.id)

# Public API
func get_item(id: String) -> ItemData:
	if _item_registry.has(id):
		return _item_registry[id]
	return null

func get_id(item: ItemData) -> String:
	if item == null:
		return ""
	return item.id
