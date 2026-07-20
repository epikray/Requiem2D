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
func _process(_delta: float) -> void:
	pass

# Switch from stage to field
func _on_battle_resolve() -> void:
	view_field()
	pass
	
# Hide stage and focus view on the player
func view_field() -> void: 
	field.set_primary(true)
	stage.set_primary(false)
	pass

# Hide field and focus view on the center of the stage
func view_stage() -> void:
	field.set_primary(false)
	stage.set_primary(true)
	pass


func _on_begin_battle(player_team: Array[StageChar], enemy_team: Array[StageChar]) -> void:
	view_stage()
	pass # Replace with function body.


# TODO: This is 
func _on_resovle_battle() -> void:
	view_field()
	pass # Replace with function body.
