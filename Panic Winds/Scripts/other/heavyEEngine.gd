extends StaticBody2D
var InputBind = "InputOne"
var blockHealth = 85
var blockArmor = 10
var spawnPosition : Vector2
var spawnRotation : float
var weight = 0.7
var playerOwner
var spawnName : String
var listCoords: Vector2
var fuelEfficiency  = 0.95
var speed = 450
var blockWeight = 0.3
var looping = false
var heatScore = 0

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
	blockArmor = 10 + GlobalVars.shipArmor
	if(Input.is_action_pressed(GlobalVars.oneBind) && InputBind == "InputOne" ||Input.is_action_pressed(GlobalVars.twoBind) && InputBind == "InputTwo"||Input.is_action_pressed(GlobalVars.threeBind) && InputBind == "InputThree"||Input.is_action_pressed(GlobalVars.fourBind) && InputBind == "InputFour"||Input.is_action_pressed(GlobalVars.fiveBind) && InputBind == "InputFive"||Input.is_action_pressed(GlobalVars.sixBind)||Input.is_action_pressed(GlobalVars.sevenBind) && InputBind == "InputSeven"||Input.is_action_pressed(GlobalVars.eightBind) && InputBind == "InputEight"||Input.is_action_pressed(GlobalVars.nineBind) && InputBind == "InputNine"):
		if !looping:
			$AudioStreamPlayer2D.play()
			looping = true
	else:
		looping = false
		$AudioStreamPlayer2D.stop()
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
	if GlobalVars.gamePaused == false:
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
	if GlobalVars.Energy > 0 && GlobalVars.currentPlayer.name == playerOwner.name:
		var rotationDegrees = $"..".rotation_degrees + self.rotation_degrees
		var rotationRadians = deg_to_rad(rotationDegrees)
		var direction = Vector2(cos(rotationRadians),sin(rotationRadians))
		GlobalVars.xVelocity -= (speed * direction.y * delta)
		GlobalVars.yVelocity -= (speed * direction.x * delta)
		GlobalVars.Energy -= speed/200 * 1/fuelEfficiency * delta


func _on_audio_stream_player_2d_finished():
	if looping:
		$AudioStreamPlayer2D.play(1.1)
	else:
		$AudioStreamPlayer2D.stop()
