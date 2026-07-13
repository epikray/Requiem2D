extends CharacterBody2D

@export var controller : FCharController
@export var view : CharView

@export var data: CharData
## TODO: this will be gathered from CharData
@export var speed: float = 100

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
