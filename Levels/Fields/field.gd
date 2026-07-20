class_name Field
extends Node2D

# This might remain a terrain. Untill world state can change tiles or tiles layers, scary...
@export var terrain : Node2D

# TODO: this will probably be replace with some 'entity controller' script
# @export is dependency injection on the scene tree. its just more honest.
@export var entities : Node2D  
@export var camera : CameraCtrl

# Signals to Stage or Level mainly
signal begin_battle(player_team: Array[StageChar], enemy_team: Array[StageChar])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_connect_fchar_signals()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func set_primary(enabled: bool) -> void:
	visible = enabled
	camera.enabled = enabled
	if enabled:
		process_mode = Node.PROCESS_MODE_INHERIT
	else:
		process_mode = Node.PROCESS_MODE_DISABLED
	pass
	pass

func _set_up_battle(caller: FieldChar, subject: FieldChar) -> void:
	var fstring = "%s sed up baddol %s" % [caller.name, subject.name]
	print(fstring)
	var caller_schar = caller.create_stagerep()
	if !caller_schar is StageChar:
		printerr("StageRep of caller %s is not a StageChar" % caller.name)
		return
	var subject_schar = subject.create_stagerep()
	if !subject_schar is StageChar:
		printerr("StageRep of subject %s is not a StageChar" % subject.name)
		return
	
	print("Ready to start baddol")
	
	var player_team: Array[StageChar]
	var enemy_team: Array[StageChar]
	# NOTE: There are many places to do this check, but the check 'who is the player' needs to be done somewhere
	if caller.is_in_group("NPCFieldChars"):
		enemy_team.append(caller_schar)
		player_team.append(subject_schar)
	else:
		player_team.append(caller_schar)
		enemy_team.append(subject_schar)
	
	
	begin_battle.emit(player_team, enemy_team)
	pass

func _connect_fchar_signals() -> void:
	# NOTE: find_children(recursive = false) is important
	for ent in entities.find_children("", "FieldChar", false, true):
		var fchar = ent as FieldChar
		fchar.request_battle.connect(_set_up_battle)
	pass


func _on_stage_resovle_battle() -> void:
	pass # Replace with function body.
