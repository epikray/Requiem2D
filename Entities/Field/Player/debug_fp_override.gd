extends Node

var parent : FieldChar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	parent = get_parent()
	parent.data.char_name = "DUMB STUPID NAME THAT I DONT WANT SAVED TO DISK!"
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_physical_key_pressed(KEY_P):
		save_chardata()
	pass

func save_chardata() -> void:
	var err = ResourceSaver.save(parent.data)
	print("DEBUG: Overwrote char data of ", parent.name, err)
	pass
