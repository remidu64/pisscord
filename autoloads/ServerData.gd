extends Node

var connectedUsers:int = 0

var curIP:String
var favIPs = []

var connectedUsersString:String = ""
var connectedUsersList:Array = []

func _ready():
	if not SaveData.load_from_config("list"):
		SaveData.save_to_config("list", ["localhost"])
	favIPs = SaveData.load_from_config("list")
	
func add_fav_server(serverip):
	favIPs.append(serverip)
	SaveData.save_to_config("list", favIPs)

func remove_fav_server(serverip):
	for i in favIPs.size():
		if favIPs[i] == serverip:
			favIPs.remove_at(i)
			SaveData.save_to_config("list", favIPs)
			Global.fav_server_list.reload()
			break
