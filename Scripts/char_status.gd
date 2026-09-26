class_name CharStatus
extends VBoxContainer

@export var ValLabel_HP : Label
@export var ValLabel_SP : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func setHP(val: float) -> void :
	ValLabel_HP.text = String.num(val, 1)
	pass
	
func setSP(val: float) -> void :
	ValLabel_SP.text = String.num(val, 1)
	pass
