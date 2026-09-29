extends Ability


# If we make a resource with a callable, we can make Ability extremely versatile,
# and remove our need to extend it for every Ability

# Can be not set, then it's not used
@export var impact_data : ImpactData
# Can be not set, than execute is instantly used.
@export var action_fx : ActionFX


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func execute(user : StageChar) -> void:
	_play()
	print(user.name, " executing ability Slash on ", user.sel_target.name);
	pass

func _play() -> void:
	action_fx.start()
	pass

func _stop() -> void:
	action_fx.queueCancel()
	pass
