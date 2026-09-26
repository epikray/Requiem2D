extends Resource
class_name CharDataRes

@export var char_name : String
@export var def_actions : Dictionary[int, Action]
@export var spec_actions : Array[Action]
@export var health : int
@export var stamina : int
@export var strength : int
@export var magic : int

func create_chardata() -> CharData :
	var data = CharData.new()
	data.char_name = char_name
	#data.def_actions = def_actions
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
