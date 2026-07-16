extends Node2D

# Level script has the job of organizing whether the map or stage is shown
# Im tripping up on this being the general *level* node, but then im always using 
@export var field : Field
@export var stage : Stage 

# NOTE: How we are moving to set things up is leading to all entities that can exist on stage 
# and in the field having a corresponding entity in each context. 
# For now we make a condition that either the field or stage are active, and therefore only one of
# the entities can be active. (WAAAY) Later we want both to be 'active', but only one is controlled.
var player : CharacterBody2D

var playerActiveInStage : bool = false 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = Global.get_player();
	view_field()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Switch from field to stage
func _on_battle() -> void:
	
	var data : BattleData
	#data.player = player
	#data.enemy = data_gathered_from_whoever_signaled_to_battle
	
	
	stage.load_battle_data(data)
	view_stage()
	pass

# Switch from stage to field
func _on_battle_resolve() -> void:
	view_field()
	pass

# TODO: Eventually camera will have its own manager and directives based on certain signal

# Hide stage and focus view on the player
func view_field() -> void: 
	field.visible = true;
	field.set_process(true);
	stage.visible = false;
	stage.set_process(false)
	pass

# Hide field and focus view on the center of the stage
func view_stage() -> void:
	field.visible = false;
	field.set_process(false);
	stage.visible = true;
	stage.set_process(true);
	pass
