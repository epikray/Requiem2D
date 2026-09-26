class_name QuickSelection
extends GridContainer

@export var pan1 : Control
@export var pan2 : Control
@export var pan3 : Control
@export var pan4 : Control
@export var pan5 : Control
@export var pan6 : Control
@export var pan7 : Control
@export var pan8 : Control
@export var pan9 : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
