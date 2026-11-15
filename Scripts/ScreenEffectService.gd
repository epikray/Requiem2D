class_name ScreenEffectService
extends ColorRect


var cur_cutoff : float
var dir_cutoff : int = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dir_cutoff < 0.0 :
		if cur_cutoff > 0.0:
			cur_cutoff -= delta
		else:
			cur_cutoff = 0.0
	else :
		if cur_cutoff < 1.0:
			cur_cutoff += delta
		else:
			cur_cutoff = 1.0
	pass
	material.set_shader_parameter("cutoff", cur_cutoff)
	
	
func curtainUp() -> void:
	dir_cutoff = 1.0
	pass
	
func curtainDown() -> void:
	dir_cutoff = -1.0
	pass
