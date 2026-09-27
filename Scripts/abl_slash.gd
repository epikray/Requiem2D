extends Ability

# We need some 
#@export var action_data : Action
@export var action_fx : ActionFX


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	action_fx.visible = false;
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func execute(user : StageChar, target : StageChar) -> void:
	_play()
	print(user.name, " executing ability Slash on ", target.name);
	pass

func _play() -> void:
	action_fx.visible = true;
	action_fx.start()
	pass
