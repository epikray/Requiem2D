extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: We are already extending Area2D, we don't need to connect this as a signal. But maybe it works just as well
	area_entered.connect(seeing_react)
	area_shape_entered.connect(seeing_shape_react)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var bodies : Array[Node2D] = get_overlapping_bodies()
	#The owner of this view will also 'see' themselves here. Could get annoying...
	#if bodies.size() > 1 :
	#	print(bodies)
	pass
	
func seeing_react(area: Area2D) -> void:
	print("area %s my field of view" % area.name)
	pass
	
func seeing_shape_react(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	var other_shape_owner_id = area.shape_find_owner(area_shape_index)
	var other_shape_node = area.shape_owner_get_owner(other_shape_owner_id)

	print("Shape %d with name %s entered my field of view" % [other_shape_owner_id, other_shape_node.name])
	pass


func seeing_body_react(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	var body_shape_owner = body.shape_find_owner(body_shape_index)
	var body_shape_node = body.shape_owner_get_owner(body_shape_owner)

	print("Body %d with name %s entered my field of view" % [body_shape_owner, body_shape_node.name])
	pass
