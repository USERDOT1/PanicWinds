extends StaticBody2D
var blockHealth = 100
var blockArmor = 0
@onready var main = get_tree().get_root().get_node("Sandbox")
@onready var projectile = load("res://Scenes/basic_bullet.tscn")
var InputBind = "InputTwo"
var spawnPosition : Vector2
var spawnRotation : float
var weight = 0.5
var playerOwner
var spawnName : String
var listCoords: Vector2
var blockWeight = 0.5
var power = 45
var penetration = 30
var countdown = 0.4
var timer = 0
var heatScore = 0

func _ready():
	$GunTestSprite.animation = "GunBindTwo"
	playerOwner = $"..".name
	name = spawnName
	global_position = spawnPosition
	global_rotation = deg_to_rad(spawnRotation)
func _process(delta):
	if get_parent().cloaked:
		if $GunTestSprite.modulate.a < 0:
			$GunTestSprite.modulate.a = 0
		if $GunTestSprite.modulate.a > 0.04:
			$GunTestSprite.modulate.a = 0.04
		$GunTestSprite.modulate.a += randf_range(-0.001,0.001)
	else:
		$GunTestSprite.modulate.a = 1
	blockArmor = 0 + GlobalVars.shipArmor
	timer += delta
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
	if !GlobalVars.gamePaused && !GlobalVars.buildingEnabled:
		if Input.is_action_pressed(GlobalVars.oneBind) && InputBind == "InputOne":
			action(delta)
		if Input.is_action_pressed(GlobalVars.twoBind) && InputBind == "InputTwo":
			action(delta)
		if Input.is_action_pressed(GlobalVars.threeBind) && InputBind == "InputThree":
			action(delta)
		if Input.is_action_pressed(GlobalVars.fourBind) && InputBind == "InputFour":
			action(delta)
		if Input.is_action_pressed(GlobalVars.fiveBind) && InputBind == "InputFive":
			action(delta)
		if Input.is_action_pressed(GlobalVars.sixBind) && InputBind == "InputSix":
			action(delta)
		if Input.is_action_pressed(GlobalVars.sevenBind) && InputBind == "InputSeven":
			action(delta)
		if Input.is_action_pressed(GlobalVars.eightBind) && InputBind == "InputEight":
			action(delta)
		if Input.is_action_pressed(GlobalVars.nineBind) && InputBind == "InputNine":
			action(delta)
func action(delta):
	if GlobalVars.roundStart <= 0:
		if playerOwner == GlobalVars.currentPlayer:
			if GlobalVars.heavyRounds == 0:
				if timer > countdown:
					print()
					$GunChamberOne.play()
					timer = 0
			else:
				if timer > countdown:
					timer = 0
					GlobalVars.heavyRounds -= 1
					heatScore = 20
					GameManager.spawnProjectile.rpc("res://Scenes/heavy_round.tscn", playerOwner.rotation,self.rotation,self.global_position,GlobalVars.xVelocity,GlobalVars.yVelocity, playerOwner.name, power * GlobalVars.shipDamageMultiplyer, penetration)
