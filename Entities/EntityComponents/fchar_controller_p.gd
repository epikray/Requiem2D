class_name FCharController_P
extends FCharController

@export var interactArea : Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interactArea.body_entered.connect(_list_overlapping_bodies2)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_read_input()
	_rotate_ia()
	if ip_conf:
		_querry_interactables()
	pass

func _read_input() -> void:
	i_dir = Input.get_vector("left", "right", "up", "down")
	ip_conf = Input.is_action_just_pressed("confirm")
	if Input.is_action_pressed("confirm") :
		i_conf = true
	else:
		i_conf = false
		
	ip_canc = Input.is_action_just_pressed("cancel")
	if Input.is_action_pressed("cancel") :
		ip_canc = true
	else:
		ip_canc = false
	pass
	
func _rotate_ia() -> void:
	if i_dir != Vector2(0,0):
		if i_dir.y > 0:
			interactArea.rotation = acos(i_dir.x)
		else:
			interactArea.rotation = -acos(i_dir.x)
			pass
	pass
	
func _querry_interactables() -> void:
	_list_overlapping_bodies()
	
func _list_overlapping_bodies() -> void:
	var bodies = interactArea.get_overlapping_bodies()
	print("InteractArea querry:\n",bodies)
	var others = interactArea
pass	

func _list_overlapping_bodies2(body: Node2D) -> void:
	var bodies = interactArea.get_overlapping_bodies()
	print("InteractArea querry:\n", body, bodies)
	var others = interactArea
pass	
