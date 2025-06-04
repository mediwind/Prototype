extends Node

const SAVE_FILE_PATH = "user://game_data.tres"

var game_data: GameData


func _ready():
    load_game_data()


func save_game_data():
    ResourceSaver.save(game_data, SAVE_FILE_PATH)


func load_game_data():
    if ResourceLoader.exists(SAVE_FILE_PATH):
        var loaded_data = ResourceLoader.load(SAVE_FILE_PATH) as GameData
        if loaded_data:
            game_data = loaded_data
        else:
            print("Failed to load game data resource.")
            initialize_default_values()
    else:
        print("No save file found, initializing default values.")
        initialize_default_values()


func initialize_default_values():
    game_data = GameData.new()
    game_data.currency_data = CurrencyData.new()
    game_data.skill_data = SkillData.new()
    game_data.level_and_exp_data = LevelAndExpData.new()
    game_data.inventory_data = InventoryData.new()
    game_data.stat_data = StatData.new()