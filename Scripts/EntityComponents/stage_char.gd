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
	controller.cDefaultAction.connect(_handleCommand_DefaultAction)
	controller.cSpecialAction.connect(_handleCommand_SpecialAction)
	controller.cNavTarget.connect(_handleCommand_NavTarget)
	controller.cCancelAction.connect(_handleCommand_CancelAction)
	controller.cTryFlee.connect(_handleCommand_TryFlee)
	
	for ablKey in data.def_actions:
		# Orphaned nodes added to this node 
		add_child(data.def_actions[ablKey]) 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if controller.i_dir.x > 0.5:
		sel_target = enemy_team[0]
	if controller.i_dir.x < -0.5:
		sel_target = my_team[0]
	pass
	
	pass
	
func _handleCommand_DefaultAction(num: int) -> void:
	print(name, " Doing default action ", num)
	
	if (data.def_actions.has(num)):
		data.def_actions[num].execute(self)
		print(name, " Doing default ability ", num)
	else :
		print(name, " tried doing null ability ", num)	
	
	pass
	
func _handleCommand_SpecialAction(num: int) -> void:
	print(name, " Doing Special action ", num)
	# Abilities grant actions. You need the *ability* "Slash" to do the *action* slash
	# data.spec_actions[num].execute(self, sel_target)
	
func _handleCommand_NavTarget(dir : Vector2i) -> void:
	print(name, " Moving targetting ", dir)
	# Target selection is an 'ability' that can be turned off
	# self.targetSelect.execute(self, sel_target, dir)
	
func _handleCommand_CancelAction() -> void:
	# How do we cancel action in a clean way?
	pass

func _handleCommand_TryFlee() -> void:
	print("%s ran from battle" % my_team[0])
	request_resolve_battle.emit()
	pass
