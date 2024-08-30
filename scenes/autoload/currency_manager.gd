extends Node


func add_currency(type: String, amount: int):
    match type:
        "gold":
            SaveManager.game_data.currency_data.gold += amount
        "faith":
            SaveManager.game_data.currency_data.faith += amount
        "soul":
            SaveManager.game_data.currency_data.soul += amount
        _:
            print("Unknown currency type: ", type)
    # SaveManager.save_game_data()


func spend_currency(type: String, amount: int) -> bool:
    match type:
        "gold":
            if SaveManager.game_data.currency_data.gold >= amount:
                SaveManager.game_data.currency_data.gold -= amount
                # SaveManager.save_game_data()
                return true
        "faith":
            if SaveManager.game_data.currency_data.faith >= amount:
                SaveManager.game_data.currency_data.faith -= amount
                # SaveManager.save_game_data()
                return true
        "soul":
            if SaveManager.game_data.currency_data.soul >= amount:
                SaveManager.game_data.currency_data.soul -= amount
                # SaveManager.save_game_data()
                return true
        _:
            print("Unknown currency type: ", type)
    return false