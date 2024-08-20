extends StaticBody2D
var InputBind = "InputOne"
var blockHealth = 90
var blockArmor = 0
var spawnPosition : Vector2
var spawnRotation : float
var weight = 0.8
var playerOwner
var spawnName : String
var listCoords: Vector2
var fuelEfficiency  = 0.9 
var speed = 400
var blockWeight = 0.5

func _ready():
	name = spawnName
	self.global_position = spawnPosition
	self.global_rotation = deg_to_rad(spawnRotation)

func _process(delta):
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name)
		GlobalVars.placedBlocks.erase(listCoords)
	if GlobalVars.gamePaused == false:
		if Input.is_action_pressed("OnePressed") && InputBind == "InputOne":
			action(delta)
			pass
		if Input.is_action_pressed("TwoPressed") && InputBind == "InputTwo":
			action(delta)
			pass
		if Input.is_action_pressed("ThreePressed") && InputBind == "InputThree":
			action(delta)
			pass 
		if Input.is_action_pressed("FourPressed") && InputBind == "InputFour":
			action(delta)
			pass
		if Input.is_action_pressed("FivePressed") && InputBind == "InputFive":
			action(delta)
			pass
		if Input.is_action_pressed("SixPressed") && InputBind == "InputSix":
			action(delta)
			pass
		if Input.is_action_pressed("SevenPressed") && InputBind == "InputSeven":
			action(delta)
			pass
		if Input.is_action_pressed("EightPressed") && InputBind == "InputEight":
			action(delta)
			pass
		if Input.is_action_pressed("NinePressed") && InputBind == "InputNine":
			action(delta)
			pass
func action(delta):
	if GlobalVars.Fuel > 0 && GlobalVars.currentPlayer.name == playerOwner.name:
		var rotationDegrees = $"..".rotation_degrees + self.rotation_degrees
		var rotationRadians = deg_to_rad(rotationDegrees)
		var direction = Vector2(cos(rotationRadians),sin(rotationRadians))
		GlobalVars.xVelocity -= (speed * direction.y * delta * 1/GlobalVars.shipWeight * 0.95)
		GlobalVars.yVelocity -= (speed * direction.x * delta * 1/GlobalVars.shipWeight * 0.95)
		GlobalVars.Fuel -= speed/200 * 1/fuelEfficiency * delta
