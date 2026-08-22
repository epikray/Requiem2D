class_name Action
extends InvObject

@export var windUpTime : float
@export var actTime : float
@export var coolDownTime : float
enum impactShape {SLASH, THRUST, SLAM, BLOCK, PARRY, DODGE, BOLT, BEAM, BLAST}

@export var shape : impactShape
@export var fakeDamage : int
