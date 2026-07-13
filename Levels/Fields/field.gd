class_name Field
extends Node2D

# This might remain a terrain. Untill world state can change tiles or tiles layers, scary...
@export var terrain : Node2D

# TODO: this will probably be replace with some 'entity controller' script
# @export is dependency injection on the scene tree. its just more honest.
@export var entities : Node2D  

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_primary(enabled: bool) -> void:
	visible = enabled
	set_process(enabled)
	pass
