class_name FCharController_NP
extends FCharController

var tot_time = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tot_time += delta
	var y : float = sin(2*PI*tot_time)
	var x : float = cos(2*PI*tot_time)
	i_dir = Vector2(x, y)
	pass
