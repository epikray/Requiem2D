extends CanvasLayer
class_name MainHud

class HudState:
	var playerController : SCharController_P
	
	var focusedPlayer : StageChar
	var players: Array[StageChar]
	
	var focusedEnemy : StageChar
	var enemies: Array[StageChar]

enum HUD {mainMenu, field, combat} 

## MainHUD owns and switches between HUD nodes, and has the responsibility of 
## supplying them with state.
@export var mainMenu : Control
@export var fieldHUD : Control
@export var combatHUD : Control
var currHUD : Control
var state : HudState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.hud = self
	Global.enable(mainMenu)
	currHUD = mainMenu
	
	if (fieldHUD) :
		Global.disable(fieldHUD)
	if (combatHUD) :
		Global.disable(combatHUD)
	
	pass # Replace with function body.

func setHUD(eHud : MainHud.HUD) -> void:
	Global.disable(mainMenu)
	Global.disable(fieldHUD)
	Global.disable(combatHUD)
	match eHud :
		MainHud.HUD.mainMenu:
			Global.enable(mainMenu)
			if mainMenu.has_method("initGUI"):
				mainMenu.initGUI()
			pass
		MainHud.HUD.field:
			Global.enable(fieldHUD)
			if fieldHUD and fieldHUD.has_method("initGUI"):
				fieldHUD.initGUI()
			pass
		MainHud.HUD.combat:
			Global.enable(combatHUD)
			if combatHUD and combatHUD.has_method("initGUI"):
				combatHUD.initGUI()
			pass
	pass

func _setCurrHUD(hud : Control) -> void:
	Global.disale(currHUD)
	Global.enable(hud)
	currHUD = hud
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Update state of the active HUD from gamestate acquired from Global
	pass
