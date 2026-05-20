class_name MainScene extends Node

@export var world_2d : Node2D
@export var gui : Control

var curr_2d_scene : Node2D
var curr_gui_scene : Control

###
# Responsibilities: This classs handles scene changes
###


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.main = self
	if world_2d.get_child_count() != 0 : 
		curr_2d_scene = world_2d.get_child(0)
		
	if gui.get_child_count() != 0 : 
		curr_gui_scene = gui.get_child(0)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func change_2d_scene(scene_path : String, delete : bool = true, keep_running : bool = false) -> void : 
	if curr_2d_scene != null : 
		if delete :
			curr_2d_scene.queue_free() # Removes previous scene node from mem
		elif keep_running : 
			curr_2d_scene.visible = false # Hides previous scene. NOTE: MainScene will 'forget' about this scene while its still active
		else :
			world_2d.remove_child(curr_2d_scene)
	var new = load(scene_path).instantiate()
	world_2d.add_child(new)
	curr_2d_scene = new	
	pass
	
func remove_2d_scene(delete : bool = true, keep_running : bool = false) -> void :
	if curr_2d_scene != null:
		if delete :
			curr_2d_scene.queue_free()
		elif keep_running : 
			curr_2d_scene.visible = false # Hides previous scene. NOTE: MainScene will 'forget' about this scene while its still active
		else :
			world_2d.remove_child(curr_2d_scene)	
		curr_2d_scene = null
	pass
	

	
func change_gui_scene(scene_path : String, delete : bool = true, keep_running : bool = false) -> void : 
	if curr_gui_scene != null : 
		if delete :
			curr_gui_scene.queue_free() # Removes previous scene node from mem
		elif keep_running : 
			curr_gui_scene.visible = false # Hides previous scene. NOTE: MainScene will 'forget' about this scene while its still active
		else :
			gui.remove_child(curr_gui_scene)
	var new = load(scene_path).instantiate()
	gui.add_child(new)
	curr_gui_scene = new	
	pass
	
func remove_gui_scene(delete : bool = true, keep_running : bool = false) -> void :
	if curr_gui_scene != null:
		if delete :
			curr_gui_scene.queue_free()  # Removes previous scene node from mem
		elif keep_running : 
			curr_gui_scene.visible = false # Hides previous scene. NOTE: MainScene will 'forget' about this scene while its still active
		else :
			gui.remove_child(curr_gui_scene)	
		curr_gui_scene = null
	pass
	
