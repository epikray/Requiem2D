class_name DataScene extends Node

##
# I believe the big responsibility of this class is gonna be to:
#	Read static-data file -> Instance Data classes
#	Read dynamic-data file -> Instance rewritable Data classes -> (when wished for) Write dynamic-data file 
##

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.data = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
