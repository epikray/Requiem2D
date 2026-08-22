class_name StageChar
extends Node2D

@export var controller : SCharController
@export var view : CharView
var data: CharData

var my_team : Array[StageChar] 
var enemy_team : Array[StageChar] 

var sel_target : StageChar

signal request_resolve_battle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("confirm"):
		print("%s attack %s using a %s, dealing %d damage" % [my_team[0], enemy_team[0], data.actions[0].name, data.actions[0].fakeDamage])
	
	if controller.ip_canc:
		print("%s ran from battle" % my_team[0])
		request_resolve_battle.emit()
	
	if controller.i_dir.x > 0.5:
		sel_target = enemy_team[0]
	if controller.i_dir.x < -0.5:
		sel_target = my_team[0]
		
	
	pass
