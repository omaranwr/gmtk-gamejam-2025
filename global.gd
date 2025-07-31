extends Node

var game_speed : float = 150
var player_position : Vector2 = Vector2.ZERO
var _speed_increase : float = 5

func _physics_process(delta: float) -> void:
	game_speed += _speed_increase*delta
