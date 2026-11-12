class_name CharDataServer
extends Node

# Incase of *something* i geuss
class MetaCharData:
	var data : CharData
	var users : Array[Node]

var clientLookup : Dictionary[String, MetaCharData]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func requestRead(clientName: String) -> CharData:
	if clientLookup.has(clientName):
		return clientLookup[clientName].data
	return null	
	

func request(data: CharDataRes, clientName: String, clientNode: Node) -> CharData:
	if clientLookup.has(clientName):
		var dataInstance = clientLookup[clientName]
		dataInstance.users.append(clientNode)
		return dataInstance.data
	
	var dataInstance = MetaCharData.new()
	dataInstance.data = data._create_chardata()
	dataInstance.users.append(clientNode)
	clientLookup.set(clientName, dataInstance)
	return dataInstance.data
