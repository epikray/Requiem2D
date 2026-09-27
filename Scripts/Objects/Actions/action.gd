class_name Action
extends InvObject

@export var windUpTime : float
@export var actTime : float
@export var coolDownTime : float

# This will be congregated into an Impact struct and then turned into an array
enum impactShape {SLASH, THRUST, SLAM, BLOCK, PARRY, DODGE, BOLT, BEAM, BLAST}
@export var shape : impactShape
@export var fakeDamage : int
