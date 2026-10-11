class_name QuickSelection
extends GridContainer

# Doesn't have to be an Ability Array, anything with a displayable and executable interface is good
@export var abilities : Dictionary[int, Ability]
	
@export var buttons : Dictionary[int, Button]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	populate_grid(abilities)
	visible = true
	pass # Replace with function body.

func anon_arg(anon_object) -> void:
	if anon_object.has_method("MadeUpMethod"):
		anon_object.MadeUpMethod()
	#if anon_object.has_
	anon_object.MadeUpParam = "Kalle Anka"
	pass	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func populate_grid(inAbilities : Dictionary[int, Ability]) -> void:
	for idButton in buttons:
		if abilities.has(idButton):
			buttons[idButton].icon = abilities[idButton].icon
		else:
			buttons[idButton].icon = null
	pass

func _activation_to_stagechar(idx: int) -> void:
	print("Selected action ", abilities[idx])
	pass
	
# Spamming grab_focus might not be 'healthy'.
# Turn this continous input to a pulse signal 
func hoverSel(sel: int) -> void:
	match (sel): 
		1: 
			#pan1.grab_focus(false)
			pass
		2: 
			#pan2.grab_focus(false)
			pass
		3: 
			#pan3.grab_focus(false)
			pass
		4: 
			#pan4.grab_focus(false)
			pass
		5: 
			#pan5.grab_focus(false)
			pass
		6: 
			#pan6.grab_focus(false)
			pass
		7: 
			#pan7.grab_focus(false)
			pass
		8: 
			#pan8.grab_focus(false)
			pass
		9: 
			#pan9.grab_focus(false)	
			pass
		
	pass
