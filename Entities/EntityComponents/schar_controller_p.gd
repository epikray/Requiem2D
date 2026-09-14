class_name SCharController_P
extends SCharController

enum controlState {DEFAULT, CLASSIC, TARGETTING}
var cState : controlState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cState = controlState.DEFAULT
	pass # Replace with function body.

func _changeState(newState: controlState) -> void:
	match (newState):
		controlState.DEFAULT:
			cState = newState
			pass
		controlState.CLASSIC:
			cState = newState
			pass
		controlState.TARGETTING:
			cState = newState
			pass	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	_read_controlstate()
	_read_input()
	match (cState):
		controlState.DEFAULT:
			pass
		controlState.CLASSIC:
			pass
		controlState.TARGETTING:
			pass
			
	pass
	
func _read_controlstate() -> void:
	if (Input.is_physical_key_pressed(KEY_SHIFT)):
		cState = controlState.CLASSIC
		pass
	
	if (Input.is_physical_key_pressed(KEY_CTRL)):
		cState = controlState.TARGETTING
		pass
		
	cState = controlState.DEFAULT 
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
