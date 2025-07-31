extends CharacterBody2D

@export var ms_to_max_speed: float = 100
@export var ms_to_stop: float = 50

var direction: float = 0
var acceleration: float = 200
var friction: float = 200
@export var max_speed: float = 250

@export var speed: float = 10

func _ready() -> void:
	
	acceleration = max_speed / (ms_to_max_speed / 1000)
	friction = max_speed / (ms_to_stop / 1000)
	
	acceleration += friction

func _physics_process(delta: float) -> void:
	
	max_speed = -velocity.y
	acceleration = max_speed / (ms_to_max_speed / 1000)
	friction = max_speed / (ms_to_stop / 1000)
	acceleration += friction
	
	velocity.y -= speed*delta
	
	velocity.x += direction*acceleration*delta
	
	var friction_direction: int = -sign(velocity.x)
	velocity.x += friction*friction_direction*delta
	if sign(velocity.x) == friction_direction:
		velocity.x = 0
	
	velocity.x = clamp(velocity.x, -max_speed, max_speed)
	
	move_and_slide()

func _unhandled_input(_event: InputEvent) -> void:
	direction = Input.get_axis("ui_left", "ui_right")


func _on_screen_exited() -> void:
	position.y = 100
	
