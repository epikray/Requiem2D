class_name FXBlock
extends Node2D

enum state_FXB {READY, RUNNING, DONE}
enum state_EFCT {WAITING, ACTIVE, DONE}

var state : state_FXB
var effectState : state_EFCT
var initRotation : float

@export var vfx : GPUParticles2D

@export var t_graph : Curve
@export var path : PathFollow2D
@export var followRotations: bool

@export_range(0, 1, 0.01) var doHits : Array[float]

@export var hasEffect : bool
@export_range(0, 1, 0.01) var doEffect : float
@export_range(0, 1, 0.01) var stopEffect : float

# signal ready
signal done
signal do_hit
signal do_effect
signal stop_effect


# A FXblock is in state; Ready, Active, Done (<=> Ready)
# It can be paused or canceled when needed.
# It signals when starting and when done most importantly,
# but it can also signal things like, do dmg, do effect, whatever.

var t : float
var h_count : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initRotation = rotation
	_init()
	pass # Replace with function body.

func start() -> void:
	_switchState(state_FXB.RUNNING)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match(state):
		state_FXB.READY:
			#_switchState(state_FXB.RUNNING)
			pass
		state_FXB.RUNNING:
			_dumbMovement2(delta)
			#_reallyDumbMovement(delta)
			_checkRunning()
			pass
		state_FXB.DONE:
			_switchState(state_FXB.READY)
			pass
	pass
	
func _switchState(new_state : state_FXB) -> void:
	match (new_state):
		state_FXB.READY:
			_init()
			pass
		state_FXB.RUNNING:
			state = state_FXB.RUNNING
			pass
		state_FXB.DONE:
			done.emit()
			state = state_FXB.DONE
	pass
	
func _init() -> void:
	state = state_FXB.READY
	h_count = 0;
	t = 0;
	

func _dumbMovement2(delta: float) -> void:
	t += delta
	var p_ = t_graph.sample(t)
	
	path.progress_ratio = p_
	# TODO: We don't exactly want this.t <- p.t
	# Position should be assigned yes, but rotation needs to be 'added'
	position = path.position
	if followRotations :
		rotation = path.rotation
	#transform = path.transform

func _reallyDumbMovement(delta: float) -> void:
	var path = path.get_parent() as Path2D
	path.curve.set_point_position(2, path.curve.get_point_position(2) * Vector2(cos(0.25*2 * PI * t), sin(0.25*2 * PI * t)))

func _checkRunning() -> void:
	if(t > 1.0):
		print("%s finished animation" % name)
		_switchState(state_FXB.DONE)
	
	if(hasEffect): 
		if (effectState == state_EFCT.WAITING && path.progress_ratio > doEffect) :
			do_effect.emit()
			effectState = state_EFCT.ACTIVE
			
		if (effectState == state_EFCT.ACTIVE && path.progress_ratio > stopEffect) :
			stop_effect.emit()
			effectState = state_EFCT.DONE
	
	if(h_count < doHits.size()):
		if(path.progress_ratio > doHits[h_count]):
			do_hit.emit()
			h_count += 1
