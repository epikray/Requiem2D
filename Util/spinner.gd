extends Node2D


@export_range(-1, 1, 0.01) var t : float = 0
@export_range(0, 5, 0.01) var t_speed : float = 1
var t_ : float = t
@export var rorbit_x : float
@export var rorbit_y : float

@export_range(-PI, PI, 0.01) var theta_offset: float = 0

@export var z_twist: float
@export var z_spin: float


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	t_ += delta
	
	var elipsepos : Vector2
	elipsepos.x = rorbit_x * cos(2*PI*t_ + theta_offset)
	elipsepos.y = rorbit_y * sin(2*PI*t_ + theta_offset)
	
	position = elipsepos
	
	pass
