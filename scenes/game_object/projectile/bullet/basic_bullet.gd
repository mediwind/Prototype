extends Node2D

var speed : int = 1500
var direction : Vector2
var max_distance : float = 700.0
var max_distance_squared : float
var initial_position : Vector2


func _ready():
    # 총알이 생성될 때의 위치를 저장
    initial_position = global_position
    # max_distance의 제곱값을 계산하여 저장
    max_distance_squared = max_distance * max_distance


func _process(delta):
    position += speed * direction * delta
    # 총알이 처음 위치에서 일정 거리 이상 벗어나면 제거
    if position.distance_squared_to(initial_position) > max_distance_squared:
        queue_free()