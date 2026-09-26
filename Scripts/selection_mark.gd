class_name SelectionMarker
extends Sprite2D

@export var mark_owner : StageChar
@export var target : Node2D
var marker_height = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	marker_height = texture.get_height()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mark_owner:
		target = mark_owner.sel_target
	
	if not target:
		visible = false
	else:
		visible = true		
		position.y = target.position.y - marker_height
		position.x = target.position.x
	
	pass
