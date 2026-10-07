class_name ClassicSelection
extends PanelContainer

@export var char : StageChar

@export var ilist : ItemList

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	populate_list(char)
	ilist.item_activated.connect(_activation_to_stagechar)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func populate_list(char_ : StageChar) -> void:
	ilist.clear()
	var abilites = char_.data.spec_actions
	for ability in abilites:
		ilist.add_item(ability.name, ability.icon, true)
	pass

func _activation_to_stagechar(idx: int) -> void:
	print("Selected action ", char.data.spec_actions[idx])
	pass

func set_focus() -> void:
	grab_focus()
	pass
