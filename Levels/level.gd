extends Node2D

# Level script has the job of organizing whether the map or stage is shown
@export var field : Field
@export var stage : Stage 

var player : CharacterBody2D

var playerActiveInStage : bool = false 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = %TestHero
	%TestHero.DEBUG_enter_stage.connect(_on_battle)
	%TestHero.DEBUG_exit_stage.connect(_on_battle_resolve)
	pass # Replace with function body.


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
	%TestHero.DEBUG_in_stage = true
	pass

# Switch from stage to field
func _on_battle_resolve() -> void:
	view_field()
	%TestHero.DEBUG_in_stage = false
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
