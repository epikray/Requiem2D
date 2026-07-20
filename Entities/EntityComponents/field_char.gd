class_name FieldChar
extends CharacterBody2D

@export var controller : FCharController
@export var view : CharView
@export var dataRes: CharDataRes
@export var stageRep: PackedScene

@onready var data: CharData = dataRes.create_chardata()
## TODO: this will be gathered from CharData
@export var speed: float = 100

signal request_battle(calller: FieldChar, subject: FieldChar)

func create_stagerep() -> StageChar:
	var rep = stageRep.instantiate()
	rep.data = data
	return rep

func _enter_tree() -> void:
	data = dataRes.create_chardata()
	pass

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# TODO: Check that stageRep root is of type StageChar
	var _srep_state = stageRep.get_state() # Do something with it
	controller.try_battle.connect(_sig_begin_battle)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	velocity = speed * controller.i_dir
	# TODO: Anything to interact with within range
	pass

func _physics_process(_delta: float) -> void:
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		
	if controller.ip_canc:
		print("%s wants to cancel something" % name)
	pass

func _sig_begin_battle(subject: FieldChar) -> void:
	if !subject:
		push_warning("%s signaled begin_battle without subject!" % subject.name)
		return
		
	print("%s begin_battle with %s without a starting action" % [self.name, subject.name])
	request_battle.emit(self, subject)
	
	pass
	
func _sig_begin_battle_first_action(subject: FieldChar, first_action: Action) -> void:
	if !subject:
		push_warning("%s signaled begin_battle without subject!" % subject.name)
		return

	print("%s begin_battle with %s starting action %s" % [self.name, subject.name, first_action.name])
	request_battle.emit(self, subject, first_action)

	pass
