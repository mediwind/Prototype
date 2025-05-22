extends Node

signal currency_updated(currency_name: String, new_amount: int)

var currencies = {}
var currency_data
var battle_currencies = { "gold": 0, "faith": 0, "soul": 0 }


func _ready():
    # Project Settings에서 Autoload탭의 싱글톤들의 리스트에서 SaveManager를 CurrencyManager보다 상단에 위치시킨다면
    # 아래와 같이 클래스 변수로 SaveManager를 사용할 수도 있다.
    if SaveManager.game_data.currency_data == null:
        SaveManager.game_data.currency_data = CurrencyData.new()
    currency_data = SaveManager.game_data.currency_data

    currencies = {
    "gold": {
        "icon": preload("res://scenes/ui/currency/gold_coins_pile.png"), 
        "amount": currency_data.gold},
    "faith": {
        "icon": preload("res://scenes/ui/currency/faith_praying.png"), 
        "amount": currency_data.faith},
    "soul": {
        "icon": preload("res://scenes/ui/currency/soul.png"), 
        "amount": currency_data.soul}
}


# func unlock_currency(name: String, icon_path: String, initial_amount: int = 0):
    # if not currencies.has(name):
        # currencies[name] = {"icon": preload("icon_path"), "amount": initial_amount}
        # emit_signal("currency_unlocked", name)


func add_currency(type: String, amount: int, is_battle: bool = false):
    if currencies.has(type):
        if is_battle:
            battle_currencies[type] += amount # 전투 중 임시 기록록
            currency_data.set(type, battle_currencies[type])  # SaveManager의 currency_data 업데이트
            currency_updated.emit(type, battle_currencies[type])  # 신호 발생
        else:
            currencies[type]["amount"] += amount
            currency_data.set(type, currencies[type]["amount"])  # SaveManager의 currency_data 업데이트
            currency_updated.emit(type, currencies[type]["amount"])  # 신호 발생
        # SaveManager.save_game_data()
    else:
        print("Unknown currency type: ", type)
    # SaveManager.save_game_data()


func spend_currency(type: String, amount: int) -> bool:
    if currencies.has(type):
        if currencies[type]["amount"] >= amount:
            currencies[type]["amount"] -= amount
            currency_data.set(type, currencies[type]["amount"])  # SaveManager의 currency_data 업데이트
            currency_updated.emit(type, currencies[type]["amount"])  # 신호 발생
            # SaveManager.save_game_data()
            return true
        else:
            print("Not enough ", type)
            return false
    else:
        print("Unknown currency type: ", type)
        return false


func finalize_battle_rewards():
    for type in battle_currencies.keys():
        var amount = battle_currencies[type]
        if amount > 0:
            currencies[type]["amount"] += amount
            currency_data.set(type, currencies[type]["amount"])  # SaveManager 업데이트
            currency_updated.emit(type, currencies[type]["amount"])
    battle_currencies = { "gold": 0, "faith": 0, "soul": 0 }  # 초기화