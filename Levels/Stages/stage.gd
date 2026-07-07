class_name Stage
extends Node2D

var battleData : BattleData
@export var camera : Camera2D

var Enemies : Array[Node2D]

var player : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_primary(enabled: bool) -> void:
	visible = enabled
	set_process(enabled)
	camera.enabled = enabled
	pass
	
	
# We need to handle some faux combat situation. Combat version of the characters will be placed
# in stage. Where a Combat Controller will
func load_battle_data(BattleData) -> void:
	
	pass
	
func _start_battle() -> void:
	pass
	
func _resolve_battle() -> void:
	pass
	
