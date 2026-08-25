extends Node2D

@export var windUpFXs : Array[FXBlock]
@export var actionFXs : Array[FXBlock]
@export var coolDownFXs : Array[FXBlock]

# This thing is stated. It can be in the state:
# Ready, WindUp, Action, CoolDown, Done (possibly <=> Ready)
# Along with a secondary state, Running and Paused
# Should be self-explanitory what these states mean


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
