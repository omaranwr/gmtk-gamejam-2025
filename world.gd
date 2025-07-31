extends Node2D

var obstacle : PackedScene = preload("res://obstacle.tscn")


func _spawn_obstacle(number: int = 1) -> void:
	var positions: Array[float] = []
	for i in number:
		var scene = obstacle.instantiate()
		add_child(scene)
		scene.global_position.y = Global.player_position.y - 640
		var x_position: float = clamp(
			Global.player_position.x + randf_range(-30, 30),
			-48, 48)
		var break_from_loop: bool = false
		while not break_from_loop:
			for position in positions:
				if x_position+12 > position and x_position-12 < position:
					print(positions, x_position)
					x_position = clamp(
					Global.player_position.x + randf_range(-30, 30),
					-48, 48)
				else:
					break_from_loop = true
					break
			if positions.is_empty(): break
		scene.global_position.x = x_position
		positions.append(scene.global_position.x)


func _on_spawn_timer_timeout() -> void:
	_spawn_obstacle(randi_range(1, 3))
