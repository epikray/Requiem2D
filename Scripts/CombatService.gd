class_name CombatService
extends Node

## What does this do?
## Takes care of the nonvisual gameplay management of Combat.
## 1. Setting up who should be on what side.
## 2. Tracking if and how combat should resolve.


class combatInstance:
	var players : Array[Node2D]
	var enemies : Array[Node2D]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func startBattle() -> void:
	
	pass
	
	
func enterBattle() -> void: 
	pass
