class_name CombatService
extends Node

## What does this do?
## Takes care of the nonvisual gameplay management of Combat.
## 1. Setting up who should be on what side.
## 2. Tracking if and how combat should resolve.

## So what does the Level/Field and Stage do? The visual things and node manipulation
## 1. Instanciate Character nodes
## 2. Transition animations between field and stage.

class combatInstance:
	var players : Array[Node2D]
	var enemies : Array[Node2D]
	var phase

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func placeInCombatInstance() -> void: 
	pass

func prepareBattle() -> void:
	pass
	
func beginBattle() -> void:
	pass
