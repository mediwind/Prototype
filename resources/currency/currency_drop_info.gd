extends Resource
class_name CurrencyDropInfo

"""
CurrencyDropInfo는 각 화폐의 드랍 확률과 드랍되는 양을 정의하는 클래스입니다.
이 클래스는 CurrencyDropComponent에서 사용됩니다.
각 화폐의 드랍 확률과 양을 설정할 수 있습니다.
"""

@export var currency_type: String # 화폐의 종류 (예: "gold", "faith", "soul")
@export var drop_percent: float # 드랍 확률 (0.0 ~ 1.0)
@export var min_amount: int  # 드랍량의 최소값
@export var max_amount: int  # 드랍량의 최대값