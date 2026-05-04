extends CenterContainer

@export var new_game_button : Button
@export var load_game_button : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("new_game_button.pressed", load_level)
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
	
	pass # Replace with function body.
