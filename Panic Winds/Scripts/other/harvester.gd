extends StaticBody2D
var InputBind = "InputFour"
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
var timer = 0
var miningDelay = 1
var meteorValue = 1
var inMeteor
var decellerationSpeed = 100
var decellerationEfficiencey = 0.8
var multiplyer

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
	timer += delta
	
	
	if inMeteor && harvesterActive:
		if miningDelay < timer:
			if get_parent() == GlobalVars.currentPlayer:
				timer = 0
				GlobalVars.creds += meteorValue * multiplyer
	if(Input.is_action_pressed(GlobalVars.oneBind) && InputBind == "InputOne" ||Input.is_action_pressed(GlobalVars.twoBind) && InputBind == "InputTwo"||Input.is_action_pressed(GlobalVars.threeBind) && InputBind == "InputThree"||Input.is_action_pressed(GlobalVars.fourBind) && InputBind == "InputFour"||Input.is_action_pressed(GlobalVars.fiveBind) && InputBind == "InputFive"||Input.is_action_pressed(GlobalVars.sixBind)||Input.is_action_pressed(GlobalVars.sevenBind) && InputBind == "InputSeven"||Input.is_action_pressed(GlobalVars.eightBind) && InputBind == "InputEight"||Input.is_action_pressed(GlobalVars.nineBind) && InputBind == "InputNine") && GlobalVars.Energy > delta:
		GlobalVars.Energy -= delta
		harvesterActive = true
		if GlobalVars.xVelocity > 0:
			#Positive Value
			if GlobalVars.xVelocity > decellerationSpeed * delta * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5:
				GlobalVars.xVelocity -= decellerationSpeed * delta * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5
			else:
				GlobalVars.xVelocity = 0
		else:
			#Negative Value
			if GlobalVars.xVelocity < decellerationSpeed * delta * -1 * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5:
				GlobalVars.xVelocity += decellerationSpeed * delta * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5
			else:
				GlobalVars.xVelocity = 0
		if GlobalVars.yVelocity > 0:
			#Positive Value
			if GlobalVars.yVelocity > decellerationSpeed * delta * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5:
				GlobalVars.yVelocity -= decellerationSpeed * delta * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5
			else:
				GlobalVars.yVelocity = 0
		else:
			#Negative Value
			if GlobalVars.yVelocity < decellerationSpeed * delta * -1 * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5:
				GlobalVars.yVelocity += decellerationSpeed * delta * 1/GlobalVars.shipWeight * decellerationEfficiencey * 5
			else:
				GlobalVars.yVelocity = 0
	else:
		harvesterActive = false
		mining = false
	
	if blockHealth <= 0 :
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)


func _on_mining_area_area_entered(area):
	print(area.get_parent().name)
	if area.get_parent().name == "purpleMeteor":
		timer = 0
		multiplyer = 5
		inMeteor = true
	if area.get_parent().name == "greenMeteor" || area.get_parent().name == "greenMeteor2"|| area.get_parent().name == "greenMeteor3"|| area.get_parent().name == "greenMeteor4":
		print("GREEN METEOR")
		timer = 0
		multiplyer = 3
		inMeteor = true
func _on_mining_area_area_exited(area):
	if area.get_parent().name == "purpleMeteor" || area.get_parent().name == "greenMeteor" || area.get_parent().name == "greenMeteor2"|| area.get_parent().name == "greenMeteor3"|| area.get_parent().name == "greenMeteor4":
		inMeteor = false
