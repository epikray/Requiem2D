extends CharacterBody2D

enum MOVE_STATE {UP, DOWN, LEFT, RIGHT}

@export var speed: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_input():
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = speed * input_dir
	pass
	
func _process(_delta: float) -> void:
	get_input()
	print("my velocity is ", velocity)
	move_and_slide()
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		print("I collided with ", collision.get_collider().name)
