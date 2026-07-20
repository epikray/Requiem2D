class_name SCharController_P
extends SCharController

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_read_input()
	pass
	
func _read_input() -> void:
	i_dir = Input.get_vector("left", "right", "up", "down")
	ip_conf = Input.is_action_just_pressed("confirm")
	if Input.is_action_pressed("confirm") :
		i_conf = true
	else:
		i_conf = false
		
	ip_canc = Input.is_action_just_pressed("cancel")
	if Input.is_action_pressed("cancel") :
		i_canc = true
	else:
		i_canc = false
	pass
