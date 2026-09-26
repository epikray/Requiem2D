class_name SCharController
extends Node2D

# Like FCharController, the point of this class is to translate either 
# user input or ai output into Field or Stage actions respectively

# NOTE: Temp, might be keept, might not be
var i_dir : Vector2
var i_altdir : Vector2
var ip_conf : bool
var i_conf : bool
var ip_canc : bool
var i_canc : bool

signal cDefaultAction(num : int)
signal cSpecialAction(num : int)
signal cNavTarget(dir : Vector2i)
