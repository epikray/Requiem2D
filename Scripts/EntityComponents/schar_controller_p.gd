class_name SCharController_P
extends SCharController

enum controlState {DEFAULT, CLASSIC, TARGETTING}

@onready var cSel_yjump : int = 3
@onready var cState : controlState = controlState.DEFAULT
@onready var cSel : int = 0
@onready var prevSelMove : Vector2i = Vector2i(0,0)
@onready var prevTargMove : Vector2i = Vector2i(0,0)

signal enterState (state : controlState)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _changeState(newState: controlState) -> void:
	if(cState == newState):
		# No op
		return
		
	print("P_SCtrl: Changing state to", newState)
	match (newState):
		controlState.DEFAULT:
			cState = newState
			enterState.emit(cState)
			pass
		controlState.CLASSIC:
			cState = newState
			cSel = 0
			prevSelMove = Vector2i(0,0)
			enterState.emit(cState)
			pass
		controlState.TARGETTING:
			cState = newState
			enterState.emit(cState)
			pass	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	_read_input()
	_read_controlstate()
	match (cState):
		controlState.DEFAULT:
			_interpret_input_default()
			pass
		controlState.CLASSIC:
			_interpret_input_classic()
			pass
		controlState.TARGETTING:
			_interpret_input_targetting()
			pass
			
	pass
	
func _read_controlstate() -> void:
	if (Input.is_physical_key_pressed(KEY_SHIFT)):
		_changeState(controlState.CLASSIC)
		return
	
	if (Input.is_physical_key_pressed(KEY_TAB)):
		_changeState(controlState.TARGETTING)
		return
		
	_changeState(controlState.DEFAULT)
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

func _idir_to_9sel(dir : Vector2) -> int:
	# -y 1 2 3
	#  | 4 5 6
	# +y 7 8 9
	#   -x - +x
	if (dir.y < -0.5):
		if(dir.x < -0.5):
			return 1
		elif (dir.x > -0.5 and dir.x < 0.5):
			return 2
		elif (dir.x > 0.5):
			return 3
	elif (dir.y > -0.5 and dir.y < 0.5):
		if(dir.x < -0.5):
			return 4
		elif (dir.x > -0.5 and dir.x < 0.5):
			return 5
		elif (dir.x > 0.5):
			return 6
	elif (dir.y > 0.5):
		if(dir.x < -0.5):
			return 7
		elif (dir.x > -0.5 and dir.x < 0.5):
			return 8
		elif (dir.x > 0.5):
			return 9
	
	return 5; # This should never happen

func _9sel_to_ddir(sel : int) -> Vector2i:
	match(sel):
		1:
			return Vector2i(-1,-1)
		2:
			return Vector2i(0,-1)
		3:
			return Vector2i(1,-1)
		4:
			return Vector2i(-1,0)
		5:
			return Vector2i(0,0)
		6:
			return Vector2i(1,0)
		7:
			return Vector2i(-1,1)
		8:
			return Vector2i(0,1)
		9:
			return Vector2i(1,1)
	return Vector2i(0,0)
	
func _idir_to_ddir(dir : Vector2) -> Vector2i:
	return _9sel_to_ddir(_idir_to_9sel(dir))

func _interpret_input_default() -> void:
	var hoveringSel = _idir_to_9sel(i_dir)
	
	if (ip_conf) :
		cDefaultAction.emit(hoveringSel)
	pass
	
func _interpret_input_classic() -> void:
	var selMove = _idir_to_ddir(i_dir)
	if (selMove != prevSelMove):
		cSel = cSel + selMove.x + cSel_yjump*selMove.y
		pass
	prevSelMove = selMove
	if (ip_conf) :
		cSpecialAction.emit(cSel)
	pass
	
func _interpret_input_targetting() -> void:
	var targMove = _idir_to_ddir(i_dir)
	if (targMove != prevTargMove and targMove != Vector2i(0,0)): 
		cNavTarget.emit(targMove)
	prevTargMove = targMove	
	pass
	
