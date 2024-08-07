extends Node

var gold = 0


func add_gold(amount):
    gold += amount


func spend_gold(amount):
    if gold >= amount:
        gold -= amount
        return true
    else:
        return false