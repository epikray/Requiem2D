extends CharacterBody2D

enum MOVE_STATE {UP, DOWN, LEFT, RIGHT}

@export var speed: float = 100
@export var data: CharData

signal DEBUG_enter_stage;
signal DEBUG_exit_stage;
var DEBUG_in_stage: bool = false;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello my name is %s!" % data.char_name)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = speed * input_dir
	pass
	
func DEBUG_kb_shortcuts() -> void:
	if Input.is_physical_key_pressed(KEY_I) : 
		DEBUG_enter_stage.emit()
		print("enter_stage")
		
	if Input.is_physical_key_pressed(KEY_K) : 
		DEBUG_exit_stage.emit()
		print("exit_stage")
		
	pass
	
func _process(_delta: float) -> void:
	get_input()
	DEBUG_kb_shortcuts()
		
func _physics_process(delta: float) -> void:
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		#print("I collided with ", collision.get_collider().name)
	
