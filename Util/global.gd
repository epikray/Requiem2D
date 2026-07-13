extends Node

var main : MainScene
var data : DataScene
var player : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# NOTE: Returns null if a Node name "TestHero" does not exist in global group FieldEntities
func get_player() -> Node2D:
	if player:
		return player
	else:	
		for entity in get_tree().get_nodes_in_group("FieldEntities"):
			# TODO: Entity class so that we know it is a game entity
			if entity.name == "TestHero":
				player = entity
				return player
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
