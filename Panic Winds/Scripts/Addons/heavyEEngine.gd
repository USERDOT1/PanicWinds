extends StaticBody2D
var InputBind = "InputOne"
var blockHealth = 85
var blockArmor = 0
var spawnPosition : Vector2
var spawnRotation : float
var weight = 0.8
var playerOwner
var spawnName : String
var listCoords: Vector2
var fuelEfficiency = 0.95
var speed = 450
var blockWeight = 0.7
var harvesterActive
var mining

func _ready():
	name = spawnName
	self.global_position = spawnPosition
	self.global_rotation = deg_to_rad(spawnRotation)
func _process(delta):
	if(Input.is_action_pressed("OnePressed") && InputBind == "InputOne" ||Input.is_action_pressed("TwoPressed") && InputBind == "InputTwo"||Input.is_action_pressed("ThreePressed") && InputBind == "InputThree"||Input.is_action_pressed("FourPressed") && InputBind == "InputFour"||Input.is_action_pressed("FivePressed") && InputBind == "InputFive"||Input.is_action_pressed("SixPressed")||Input.is_action_pressed("SevenPressed") && InputBind == "InputSeven"||Input.is_action_pressed("EightPressed") && InputBind == "InputEight"||Input.is_action_pressed("NinePressed") && InputBind == "InputNine"):
		harvesterActive = true
	else:
		harvesterActive = false
	if mining:
		GlobalVars.creds += 1
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name)
		GlobalVars.placedBlocks.erase(listCoords)


func _on_mining_area_area_entered(area):
	print("miningArea Entered")
	if harvesterActive:
		print("and activated")
		if area.get_parent().name == "purpleMeteor":
			mining = true
func _on_mining_area_area_exited(area):
	print("miningArea Exited")
	if harvesterActive:
		print("and activated")
		if area.get_parent().name == "purpleMeteor":
			mining = false
