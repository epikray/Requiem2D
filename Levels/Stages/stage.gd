class_name Stage
extends Node2D

# This might remain a terrain. Untill world state can change tiles or tiles layers, scary...
@export var terrain : Node2D

# TODO: Future entity controller or something
@export var entities : Node2D
@export var camera : CameraCtrl

var Enemies : Array[StageChar]
var Playables : Array[StageChar]

signal resovle_battle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	
func set_primary(enabled: bool) -> void:
	visible = enabled
	camera.enabled = enabled
	if enabled:
		process_mode = Node.PROCESS_MODE_INHERIT
	else:
		process_mode = Node.PROCESS_MODE_DISABLED
	pass

func _on_field_begin_battle(player_team: Array[StageChar], enemy_team: Array[StageChar]) -> void:
	for player_char in player_team:
		entities.add_child(player_char)
		Playables.append(player_char)
		player_char.position.x -= 10
	
	for enemy_char in enemy_team:
		entities.add_child(enemy_char)
		Enemies.append(enemy_char)
		enemy_char.position.x += 10
	
	for player_char in Playables:
		player_char.request_resolve_battle.connect(_resolve_battle_flee)
		player_char.my_team = Playables
		player_char.enemy_team = Enemies
	
	for enemy_char in Enemies:
		enemy_char.request_resolve_battle.connect(_resolve_battle_flee)
		enemy_char.my_team = Enemies
		enemy_char.enemy_team = Playables
	
	
	pass # Replace with function body.
	
func _resolve_battle_flee() -> void:
	resovle_battle.emit()
	
	for enemy in Enemies:
		enemy.queue_free()
	Enemies.clear()
		
	for playable in Playables:
		playable.queue_free()
	Playables.clear()
	
	pass
	
func _connect_schar_signals(schar: StageChar) -> void:
	schar.request_resolve_battle.connect(_resolve_battle_flee)
	pass
