extends Timer

@export var time : Label
@export var time_mod : Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time.text = String.num(time_left, 1)
	time_mod.text = "%s game sec = %d real sec" % [String.num(60/Engine.time_scale, 1), 60]
	pass
