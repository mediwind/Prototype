# FILE: currency_manager.gd
extends Node

var currency_data: CurrencyData

const SAVE_FILE_PATH = "user://currency_data.tres"


func _ready():
	load_currency_data()


func add_currency(type: String, amount: int):
	match type:
		"gold":
			currency_data.gold += amount
		"faith":
			currency_data.faith += amount
		"soul":
			currency_data.soul += amount
		_:
			print("Unknown currency type: ", type)
	save_currency_data()


func spend_currency(type: String, amount: int) -> bool:
	match type:
		"gold":
			if currency_data.gold >= amount:
				currency_data.gold -= amount
				save_currency_data()
				return true
		"faith":
			if currency_data.faith >= amount:
				currency_data.faith -= amount
				save_currency_data()
				return true
		"soul":
			if currency_data.soul >= amount:
				currency_data.soul -= amount
				save_currency_data()
				return true
		_:
			print("Unknown currency type: ", type)
	return false


func save_currency_data():
	ResourceSaver.save(currency_data, SAVE_FILE_PATH)


func load_currency_data():
	if ResourceLoader.exists(SAVE_FILE_PATH):
		currency_data = ResourceLoader.load(SAVE_FILE_PATH)
	else:
		currency_data = CurrencyData.new()
