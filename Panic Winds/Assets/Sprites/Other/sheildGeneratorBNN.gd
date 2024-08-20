extends StaticBody2D
var InputBind = "InputSix"
var blockHealth = 5
var blockArmor = 0
var spawnPosition : Vector2
var spawnRotation : float
var weight = 1
var playerOwner
var spawnName : String
var listCoords: Vector2
var fuelEfficiency  = 0.5
var speed = 1500
var blockWeight = 0.4
var looping = false
var solarPanelOn = true
var heatScore = 0
var cooldownTimer = 0
var cooldownTimerMax = 20
var resourceTimer = 0

func _ready():
	name = spawnName
	self.global_position = spawnPosition
	self.global_rotation = deg_to_rad(spawnRotation)
	
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
	if GlobalVars.barrierUp:
		resourceTimer += 0.06*delta
	if cooldownTimer > cooldownTimerMax:
		pass
	else:
		cooldownTimer += delta
	if GlobalVars.barrierUp:
		if GlobalVars.Energy > resourceTimer:
			GlobalVars.Energy -= resourceTimer
		else:
			GlobalVars.Energy = 0
			GlobalVars.barrierUp = false
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
		GlobalVars.barrierUp = false
	if GlobalVars.Energy > 1:
		if GlobalVars.gamePaused == false:
			if Input.is_action_pressed(GlobalVars.oneBind) && InputBind == "InputOne":
				action(delta)
				pass
			if Input.is_action_pressed(GlobalVars.twoBind) && InputBind == "InputTwo":
				action(delta)
				pass
			if Input.is_action_just_pressed(GlobalVars.threeBind) && InputBind == "InputThree":
				action(delta)
				pass 
			if Input.is_action_just_pressed(GlobalVars.fourBind) && InputBind == "InputFour":
				action(delta)
				pass
			if Input.is_action_just_pressed(GlobalVars.fiveBind) && InputBind == "InputFive":
				action(delta)
				pass
			if Input.is_action_just_pressed(GlobalVars.sixBind) && InputBind == "InputSix":
				action(delta)
				pass
			if Input.is_action_just_pressed(GlobalVars.sevenBind) && InputBind == "InputSeven":
				action(delta)
				pass
			if Input.is_action_just_pressed(GlobalVars.eightBind) && InputBind == "InputEight":
				action(delta)
				pass
			if Input.is_action_just_pressed(GlobalVars.nineBind) && InputBind == "InputNine":
				action(delta)
				pass
	else:
		GlobalVars.barrierUp = false
		cooldownTimer = delta
		GameManager.barrierDespawn.rpc(GlobalVars.currentPlayer.name)
func action(delta):
	print("ACTIOn")
	if GlobalVars.currentPlayer == get_parent() && cooldownTimer > cooldownTimerMax:
		if GlobalVars.barrierUp == true:
			cooldownTimer = delta
			resourceTimer = 0
			GlobalVars.barrierUp = false
			GameManager.barrierDespawn.rpc(GlobalVars.currentPlayer.name)
		else:
			resourceTimer = 0
			GameManager.barrierSpawn.rpc(GlobalVars.currentPlayer.name)
			GlobalVars.barrierUp = true
