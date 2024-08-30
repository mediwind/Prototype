extends Node


# Project Settings에서 Autoload탭의 싱글톤들의 리스트에서 SaveManager를 CurrencyManager보다 상단에 위치시킨다면
# 아래와 같이 클래스 변수로 SaveManager를 사용할 수도 있다.
# func _ready():
#     currency_data = SaveManager.game_data.currency_data


func add_currency(type: String, amount: int):
    var currency_data = SaveManager.game_data.currency_data
    match type:
        "gold":
            currency_data.gold += amount
        "faith":
            currency_data.faith += amount
        "soul":
            currency_data.soul += amount
        _:
            print("Unknown currency type: ", type)
    # SaveManager.save_game_data()


func spend_currency(type: String, amount: int) -> bool:
    var currency_data = SaveManager.game_data.currency_data
    match type:
        "gold":
            if currency_data.gold >= amount:
                currency_data.gold -= amount
                # SaveManager.save_game_data()
                return true
        "faith":
            if currency_data.faith >= amount:
                currency_data.faith -= amount
                # SaveManager.save_game_data()
                return true
        "soul":
            if currency_data.soul >= amount:
                currency_data.soul -= amount
                # SaveManager.save_game_data()
                return true
        _:
            print("Unknown currency type: ", type)
    return false