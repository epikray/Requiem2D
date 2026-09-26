class_name CombatUIController
extends Control

# Favored Controller, but we only have one controller, theres only one player :)
@export var pcController : SCharController_P
# We can rely on stage to find characters
@export var stage : Stage

@export var quickSelector : QuickSelection
@export var classicSelector: ClassicSelection

@export var playerStatus : CharStatus
@export var enemyStatus : CharStatus

var currentPC : StageChar
var focusedNPC: StageChar

enum cuiState {DEFAULT, CLASSIC, TARGETTING}
var state : cuiState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = cuiState.DEFAULT
	quickSelector.visible = true
	classicSelector.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	if (!pcController):
		#printerr("No Player Stage Controller connected!")	
		return
		
	match (state):
		cuiState.DEFAULT:
			_defaultMode(delta)
		cuiState.CLASSIC:
			_classicMode(delta)
		cuiState.TARGETTING:
			_targettingMode(delta)
		_:
			print("Unkown state value")	
	pass
	
# This function does not need to exist if we have a globally defined enum PCtrlState
# that ui and sctrl can agree on
func switchState_PCtrl(newState: SCharController_P.controlState) -> void:
	match (newState):
		SCharController_P.controlState.DEFAULT:
			_switchState(cuiState.DEFAULT)
		SCharController_P.controlState.CLASSIC:
			_switchState(cuiState.CLASSIC)
		SCharController_P.controlState:
			_switchState(cuiState.TARGETTING)
	pass

func _switchState(newState : cuiState) -> void:
	print("Combat_UI: Switch state value", newState)	
	match (newState):
		cuiState.DEFAULT:
			state = cuiState.DEFAULT
			quickSelector.visible = true
			classicSelector.visible = false
		cuiState.CLASSIC:
			state = cuiState.CLASSIC
			quickSelector.visible = false
			classicSelector.visible = true
			classicSelector.grab_focus()
		cuiState.TARGETTING:
			state = cuiState.TARGETTING
		_:
			pass
			# No op
	pass


func _defaultMode(delta: float) -> void:
	#print("Default state")	
	var iDir : Vector2 = pcController.i_dir
	
	pass


func _classicMode(delta: float) -> void:
	#print("Classic state")	
	pass

# TODO: should target selection be handeled by the ui? no
func _targettingMode(delta: float) -> void:
	#print("Targetting state")	
	
	
	pass
	
	
