extends Node2D

var curr_level : Node
# This will be our entry point

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _load_level(level_path: String) -> void:
	var level : Resource  = ResourceLoader.load(level_path)
	
	if not curr_level:
		curr_level = level.instantiate()
		add_child(curr_level)
	else :
		remove_child(curr_level)
		curr_level = level.instantiate()
		add_child(curr_level)
		pass 
	pass


func _on_new_game_select() -> void:
	_load_level("res://Scenes/Levels/test_level.tscn")
	pass
