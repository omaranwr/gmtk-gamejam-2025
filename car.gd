extends Node2D

var direction: float = 0

@onready var car := %Car

@export var drifting_speed: float
@export var distance : float = 100:
	set(value):
		distance = value
		if car: car.position.x = value

#func _ready() -> void:
	#distance = distance

func _physics_process(delta: float) -> void:
	distance += drifting_speed*delta*direction
	global_rotation += PI*delta
	rotation_degrees = wrap(rotation_degrees, -180, 180)

func _unhandled_input(_event: InputEvent) -> void:
	direction = Input.get_axis("ui_left", "ui_right")
