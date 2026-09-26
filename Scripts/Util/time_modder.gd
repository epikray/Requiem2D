extends Node

@export var key : Key
@export var togglable : bool

var isToggle : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if (Input.is_physical_key_pressed(key)):
		Engine.time_scale = 0.5
	else :
		Engine.time_scale = 1
	pass
