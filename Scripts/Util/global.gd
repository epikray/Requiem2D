extends Node




var main : MainScene
var hud : MainHud
var data : DataScene
var fplayer : Node2D
var splayer : Node2D

@onready var uiCombat = "res://Scenes/GUI/combat_ui.tscn"

@onready var lTest = "res://Scenes/Levels/test_level.tscn"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass

# This is shit, a Player is whatever StageChar or FieldChar has a PCController
# NOTE: Returns null if a Node name "TestHero" does not exist in global group FieldEntities
func get_player_field() -> Node2D:
	if fplayer:
		return fplayer
	else:	
		for entity in get_tree().get_nodes_in_group("FieldEntities"):
			# TODO: Entity class so that we know it is a game entity
			if entity.name == "TestHero":
				fplayer = entity
				return fplayer
	return null
pass	

func get_player_stage() -> Node2D:
	if splayer:
		return splayer
	else:	
		for entity in get_tree().get_nodes_in_group("StageEntities"):
			# TODO: Entity class so that we know it is a game entity
			if entity.name == "TestHeroS":
				splayer = entity
				return splayer
	return null
pass	

func change_gui_scene(scene_path : String, delete : bool = true, keep_running : bool = false) -> void:
	if main:
		main.change_gui_scene(scene_path, delete, keep_running)
	pass
	
## This is no good anymore. Use MainHud.setHUD(Global.HUD)
func change_2d_scene(scene_path : String, delete : bool = true, keep_running : bool = false) -> void:
	if main:
		main.change_2d_scene(scene_path, delete, keep_running)
	pass

func set_main(s :MainScene) -> void:
	if main == null:
		main = s
pass

func set_data(s :DataScene) -> void:
	if data == null:
		data = s
pass

func enable(node : CanvasItem) -> void: 
	if (not node):
		return
	node.visible = true
	node.set_process(true)

func disable(node : CanvasItem) -> void: 
	if (not node):
		return
	node.visible = false
	node.set_process(false)
	
# TODO: 
#func get_player() -> Node2D:
#	return null;
#pass
