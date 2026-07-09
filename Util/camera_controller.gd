class_name CameraCtrl
extends Camera2D

# TODO: Some way to pan the camera around an object
@export var focusTarget : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if focusTarget:
		position = focusTarget.position;
		
	pass
