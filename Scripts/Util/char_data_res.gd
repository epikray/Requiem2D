extends Resource
class_name CharDataRes

@export var char_name : String
# not a fan. I want a PackedScene that I can guarantee has Ability as root Node 
@export var def_actions : Dictionary[int, PackedScene] 
#@export var spec_actions : Array[Ability]
@export var health : int
@export var stamina : int
@export var strength : int
@export var magic : int

func create_chardata() -> CharData :
	# Check that the scene can be used as an Ability
	#for scene in def_actions:
	#	pass
	
	var data = CharData.new()
	data.char_name = char_name
	for ablKey in def_actions:
		data.def_actions[ablKey] = def_actions[ablKey].instantiate()
		pass
	#data.spec_actions = spec_actions
	
	data.health = health
	data.stamina = stamina
	data.strength = strength
	data.magic = magic
	return data
	
func overwrite_and_save(_delta: CharData) -> void:
	pass
	
static func write_new_res(_delta: CharData, _path: String) -> void:
	pass
