class_name FieldChar
extends CharacterBody2D

@export var controller : FCharController
@export var view : CharView
@export var data: CharData
## TODO: this will be gathered from CharData
@export var speed: float = 100

signal begin_battle

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = speed * controller.i_dir
	# TODO: Anything to interact with within range
	pass

func _physics_process(delta: float) -> void:
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
	pass

func _sig_begin_battle(caller: FieldChar, subject: FieldChar, first_action: Action) -> void:
	if !caller:
		push_warning("begin_battle without a caller!");
		return;
	if !subject:
		push_warning("%s signaled begin_battle without subject!" % subject.name)
	
	if !first_action:
		print("%s begin_battle with %s without a starting action" % caller.name % subject.name)
		begin_battle.emit(caller, subject)
	else:
		print("%s begin_battle with %s starting action %s" % caller.name % subject.name, first_action.name)
		begin_battle.emit(caller, subject, first_action)
	
	pass
