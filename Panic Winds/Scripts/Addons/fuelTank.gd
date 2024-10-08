extends StaticBody2D
var InputBind = "InputNine"
var blockHealth = 250
var blockArmor = 0
var spawnPosition : Vector2
var spawnRotation : float
var weight = 0.8
var playerOwner
var spawnName : String
var listCoords: Vector2
var fuelEfficiency  = 1
var speed = 200
var blockWeight = 1.5
var looping = false
var ejectRate = 10
var storage = 90
var heatScore = 0

func _ready():
	name = spawnName
	self.global_position = spawnPosition
	self.global_rotation = deg_to_rad(spawnRotation)
	GlobalVars.maxFuel += storage

func _process(delta):
	if get_parent().cloaked:
		if $EngineSprite.modulate.a < 0:
			$EngineSprite.modulate.a = 0
		if $EngineSprite.modulate.a > 0.04:
			$EngineSprite.modulate.a = 0.04
		$EngineSprite.modulate.a += randf_range(-0.001,0.001)
	else:
		$EngineSprite.modulate.a = 1
	blockArmor = 0 + GlobalVars.shipArmor
	if(Input.is_action_pressed("OnePressed") && InputBind == "InputOne" ||Input.is_action_pressed("TwoPressed") && InputBind == "InputTwo"||Input.is_action_pressed("ThreePressed") && InputBind == "InputThree"||Input.is_action_pressed("FourPressed") && InputBind == "InputFour"||Input.is_action_pressed("FivePressed") && InputBind == "InputFive"||Input.is_action_pressed("SixPressed")||Input.is_action_pressed("SevenPressed") && InputBind == "InputSeven"||Input.is_action_pressed("EightPressed") && InputBind == "InputEight"||Input.is_action_pressed("NinePressed") && InputBind == "InputNine"):
		if !looping:
			looping = true
	else:
		looping = false
	if blockHealth <= 0:
		GlobalVars.maxFuel -= storage
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
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
		if GlobalVars.Fuel > ejectRate * delta:
			GlobalVars.Fuel -= ejectRate * delta
		else:
			GlobalVars.Fuel = 0

