extends CanvasLayer
class_name MainHud


## MainHUD owns and switches between HUD nodes, and has the responsibility of 
## supplying them with state.

@export var mainMenu : Control
@export var fieldHUD : Control
@export var combatHUD : Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.hud = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Update state of the active HUD from gamestate acquired from Global
	pass
