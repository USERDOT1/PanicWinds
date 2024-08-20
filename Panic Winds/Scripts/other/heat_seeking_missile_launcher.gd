extends StaticBody2D
var blockHealth = 100
var blockArmor = 0
@onready var main = get_tree().get_root().get_node("Sandbox")
@onready var projectile = load("res://Scenes/heat_seeking_missile.tscn")
var InputBind = "InputThree"
var spawnPosition : Vector2
var spawnRotation : float
var weight = 0.5
var playerOwner
var spawnName : String
var listCoords: Vector2
var blockWeight = 0.7
var heatScore = 0

func _ready():
	playerOwner = $".."
	name = spawnName
	global_position = spawnPosition
	global_rotation = deg_to_rad(spawnRotation)
func _process(delta):
	if get_parent().cloaked:
		if $HomingRocketLauncherSprite.modulate.a < 0:
			$HomingRocketLauncherSprite.modulate.a = 0
		if $HomingRocketLauncherSprite.modulate.a > 0.04:
			$HomingRocketLauncherSprite.modulate.a = 0.04
		$HomingRocketLauncherSprite.modulate.a += randf_range(-0.001,0.001)
	else:
		$HomingRocketLauncherSprite.modulate.a = 1
	blockArmor = 0 + GlobalVars.shipArmor
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
	if (!GlobalVars.gamePaused || !GlobalVars.buildingEnabled) && GlobalVars.currentPlayer == playerOwner:
		if Input.is_action_just_pressed(GlobalVars.oneBind) && InputBind == "InputOne":
			action(delta)
			pass
		if Input.is_action_just_pressed(GlobalVars.twoBind) && InputBind == "InputTwo":
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
func action(delta):
	if GlobalVars.roundStart <= 0:
		if GlobalVars.missiles > 0:
			GlobalVars.missiles -= 1
			GameManager.spawnProjectile.rpc("res://Scenes/heat_seeking_missile.tscn", playerOwner.rotation,self.rotation,self.global_position,GlobalVars.xVelocity,GlobalVars.yVelocity, playerOwner.name, 35 * GlobalVars.shipDamageMultiplyer,0)
		else:
			$NoMissiles.play()
