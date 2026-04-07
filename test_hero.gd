extends Node2D

@export var sprite : Sprite2D
@export var spriteAnimPlayer: AnimationPlayer

enum ANIM_STATE {I_F, I_L, I_B, I_R, W_F, W_L, W_B, W_R}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spriteAnimPlayer.play("walk_right")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
