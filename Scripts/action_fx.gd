class_name ActionFX
extends Node2D

@export var windUpFXs : Array[FXBlock]
@export var actionFXs : Array[FXBlock]
@export var coolDownFXs : Array[FXBlock]

@export var target : Node2D

# This thing is stated. It can be in the state:
# Ready, WindUp, Action, CoolDown, Done (possibly <=> Ready)
# Along with a secondary state, Running and Paused
# Should be self-explanitory what these states mean

signal doHit 
signal doEffect
signal stopEffect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass # Replace with function body.

func start() -> void:
	if(_startBlocks(windUpFXs)):
		pass
	if(_startBlocks(actionFXs)):
		pass
	pass
	
func queueCancel() -> void:
	pass

func _startBlocks(blocks : Array[FXBlock]) -> bool:
	if(blocks.is_empty()):
		return false
		
	for block in blocks:
		block.start();
	
	return true
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_vfx_parent_do_hit() -> void:
	doHit.emit()
	pass # Replace with function body.
