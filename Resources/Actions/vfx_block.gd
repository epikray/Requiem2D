class_name FXBlock
extends Node2D

enum state_FXB {READY, RUNNING, DONE}

var state : state_FXB

@export var vfx : GPUParticles2D

# signal ready
signal done

var i : int

# A FXblock is in state; Ready, Active, Done (<=> Ready)
# It can be paused or canceled when needed.
# It signals when starting and when done most importantly,
# but it can also signal things like,

var t : float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = state_FXB.READY
	t = 0;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#vfx.
	_dumbMovement(delta)
	pass


func _dumbMovement(delta: float) -> void:
	t += delta
	position.x = 40*sin(2*PI*t*0.1)
	pass
