extends CharacterBody2D

@export var ms_to_max_speed: float = 100
@export var ms_to_stop: float = 50

var direction: float = 0
var speed: float = 200
var friction: float = 200
@export var max_speed: float = 500

func _ready() -> void:
	
	speed = max_speed / (ms_to_max_speed / 1000)
	friction = max_speed / (ms_to_stop / 1000)
	
	speed += friction

func _physics_process(delta: float) -> void:
	velocity.y = -500
	
	velocity.x += direction*speed*delta
	
	var friction_direction: int = -sign(velocity.x)
	velocity.x += friction*friction_direction*delta
	if sign(velocity.x) == friction_direction:
		velocity.x = 0
	
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	direction = Input.get_axis("ui_left", "ui_right")


func _on_screen_exited() -> void:
	position.y = 400
