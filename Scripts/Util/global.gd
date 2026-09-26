extends Node

var main : MainScene
var data : DataScene
var fplayer : Node2D
var splayer : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# This is shit, a Player is whatever StageChar or FieldChar has a PCController
# NOTE: Returns null if a Node name "TestHero" does not exist in global group FieldEntities
func get_player_field() -> Node2D:
	if fplayer:
		return fplayer
	else:	
		for entity in get_tree().get_nodes_in_group("FieldEntities"):
			# TODO: Entity class so that we know it is a game entity
			if entity.name == "TestHero":
				fplayer = entity
				return fplayer
	return null
pass	

func get_player_stage() -> Node2D:
	if splayer:
		return splayer
	else:	
		for entity in get_tree().get_nodes_in_group("StageEntities"):
			# TODO: Entity class so that we know it is a game entity
			if entity.name == "TestHeroS":
				splayer = entity
				return splayer
	return null
pass	

func set_main(s :MainScene) -> void:
	if main == null:
		main = s
pass

func set_data(s :DataScene) -> void:
	if data == null:
		data = s
pass

# TODO: 
#func get_player() -> Node2D:
#	return null;
#pass
