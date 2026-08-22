class_name CombatUIController
extends Control

# Direct dependency because I am lazy
@export var pcController : SCharController_P

@export var quickSelector : QuickSelection
@export var classicSelector: ClassicSelection
# @export var 

enum cuiState {DEFAULT, CLASSIC, TARGETTING}
var state : cuiState

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state = cuiState.DEFAULT
	quickSelector.visible = true
	classicSelector.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_physical_key_pressed(KEY_SHIFT)): 
		state = cuiState.CLASSIC
		quickSelector.visible = false
		classicSelector.visible = true
		classicSelector.grab_focus()
	else :
		state = cuiState.DEFAULT
		quickSelector.visible = true
		classicSelector.visible = false
	
	if (!pcController):
		#printerr("No Player Stage Controller connected!")	
		return
		
	match (state):
		cuiState.DEFAULT:
			_defaultMode(delta)
		cuiState.CLASSIC:
			_classicMode(delta)
		cuiState.TARGETTING:
			_targettingMode(delta)
		_:
			print("Unkown state value")	
	pass

func _defaultMode(delta: float) -> void:
	print("Default state")	
	var iDir : Vector2 = pcController.i_dir
	
	# x,y == 0.5 is ignored as a possible case
	if (iDir.x < -0.5):
		if(iDir.y < -0.5):
			print("Hovering 1")
			quickSelector.hoverSel(1)
			pass
		elif (iDir.y > -0.5 and iDir.y < 0.5):
			print("Hovering 2")
			quickSelector.hoverSel(2)
			pass
		elif (iDir.y > 0.5):
			quickSelector.hoverSel(3)
			print("Hovering 3")
			pass
	elif (iDir.x > -0.5 and iDir.x < 0.5):
		if(iDir.y < -0.5):
			print("Hovering 4")
			quickSelector.hoverSel(4)
			pass
		elif (iDir.y > -0.5 and iDir.y < 0.5):
			print("Hovering 5")
			quickSelector.hoverSel(5)
			pass
		elif (iDir.y > 0.5):
			print("Hovering 6")
			quickSelector.hoverSel(6)
			pass
	elif (iDir.x > 0.5):
		if(iDir.y < -0.5):
			print("Hovering 7")
			quickSelector.hoverSel(7)
			pass
		elif (iDir.y > -0.5 and iDir.y < 0.5):
			print("Hovering 8")
			quickSelector.hoverSel(8)
			pass
		elif (iDir.y > 0.5):
			print("Hovering 9")
			quickSelector.hoverSel(9)
			pass
	
	
	pass


func _classicMode(delta: float) -> void:
	print("Classic state")	
	
	
	
	pass
	
func _targettingMode(delta: float) -> void:
	print("Targetting state")	
	
	
	pass
	
	
