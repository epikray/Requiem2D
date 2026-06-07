extends Node

var main : MainScene
var data : DataScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func set_main(s :MainScene) -> void:
	if main == null:
		main = s
pass

func set_data(s :DataScene) -> void:
	if data == null:
		data = s
pass
