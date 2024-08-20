extends StaticBody2D
var InputBind = "InputFive"
var blockHealth = 110
var blockArmor = 12
var spawnPosition : Vector2
var spawnRotation : float
var playerOwner
var weight = 0.8
var spawnName : String
var listCoords: Vector2
var blockWeight = 1.2

func _ready():
	name = spawnName
	global_position = spawnPosition
	global_rotation = deg_to_rad(spawnRotation)

func _process(delta):
	if get_parent().cloaked:
		if $FuelGeneratorSprite.modulate.a < 0:
			$FuelGeneratorSprite.modulate.a = 0
		if $FuelGeneratorSprite.modulate.a > 0.04:
			$FuelGeneratorSprite.modulate.a = 0.04
		$FuelGeneratorSprite.modulate.a += randf_range(-0.001,0.001)
	else:
		$FuelGeneratorSprite.modulate.a = 1
	blockArmor = 0 + GlobalVars.shipArmor
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
	GlobalVars.Fuel += 0.1*delta
	if GlobalVars.gamePaused == false && GlobalVars.buildingEnabled == false:
		if Input.is_action_pressed(GlobalVars.oneBind) && InputBind == "InputOne":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.twoBind) && InputBind == "InputTwo":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.threeBind) && InputBind == "InputThree":
			action(delta)
			pass 
		if Input.is_action_pressed(GlobalVars.fourBind) && InputBind == "InputFour":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.fiveBind) && InputBind == "InputFive":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.sixBind) && InputBind == "InputSix":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.sevenBind) && InputBind == "InputSeven":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.eightBind) && InputBind == "InputEight":
			action(delta)
			pass
		if Input.is_action_pressed(GlobalVars.nineBind) && InputBind == "InputNine":
			action(delta)
			pass
func action(delta):
	if GlobalVars.Energy > delta:
		GlobalVars.Fuel += 2*delta
		GlobalVars.Energy -= delta
