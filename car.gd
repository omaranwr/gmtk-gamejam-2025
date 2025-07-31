extends CharacterBody2D

@export var ms_to_max_speed: float = 100
@export var ms_to_stop: float = 50

var direction: float = 0
var acceleration: float = 200
var friction: float = 200
@export var drifting_speed: float = 250

func _ready() -> void:
	
	acceleration = drifting_speed / (ms_to_max_speed / 1000)
	friction = drifting_speed / (ms_to_stop / 1000)
	
	acceleration += friction

func _physics_process(delta: float) -> void:
	
	var current_drifting_speed = min(Global.game_speed, drifting_speed) / 2.5
	acceleration = current_drifting_speed / (ms_to_max_speed / 1000)
	friction = current_drifting_speed / (ms_to_stop / 1000)
	acceleration += friction
	
	velocity.y = -Global.game_speed
	velocity.x += direction*acceleration*delta
	
	var friction_direction: int = -sign(velocity.x)
	velocity.x += friction*friction_direction*delta
	if sign(velocity.x) == friction_direction:
		velocity.x = 0
	
	velocity.x = clamp(velocity.x, -current_drifting_speed, current_drifting_speed)
	
	move_and_slide()
	Global.player_position = position

func _unhandled_input(_event: InputEvent) -> void:
	direction = Input.get_axis("ui_left", "ui_right")


func _on_screen_exited() -> void:
	position.y = 100
	
