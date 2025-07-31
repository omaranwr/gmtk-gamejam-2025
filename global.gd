extends Node

var game_speed : float = 200
var _speed_increase : float = 1

func _physics_process(delta: float) -> void:
	game_speed += _speed_increase*delta
