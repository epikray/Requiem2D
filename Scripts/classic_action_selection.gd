class_name ClassicSelection
extends PanelContainer

# Doesn't have to be an Ability Array, anything with a displayable and executable interface is good
@export var abilities : Array[Ability]

@export var ilist : ItemList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	populate_list(abilities)
	ilist.item_activated.connect(_activation_to_stagechar)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func populate_list(inAbilities : Array[Ability]) -> void:
	ilist.clear()
	for ability in inAbilities:
		ilist.add_item(ability.name, ability.icon, true)
	pass

func _activation_to_stagechar(idx: int) -> void:
	print("Selected action ", abilities[idx])
	pass

func set_focus() -> void:
	grab_focus()
	pass
