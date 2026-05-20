extends CenterContainer

var new_game_button : Button
var load_game_button : Button

signal new_game_select

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func load_level() -> void:
	print("Load level! :D")
	pass

# This shit is getting annoying. How do we connect signals and receivers to each other.
# Is it even worth when it is going to only one 
func _on_new_game_button_pressed() -> void:
	Global.main.change_2d_scene("res://Scenes/Levels/test_level.tscn")
	Global.main.remove_gui_scene()
	pass # Replace with function body.
