extends Node2D
var smoothedMousePosition: Vector2
var fixingRotation: Vector2
var savedRotation : float
var placementType
var blockHealth = 5
var placementRotation = deg_to_rad(90)
@export var mouseX : float
@export var mouseY : float
@export var globalMousePositionC : Vector2
@export var globalPositionC : Vector2
@export var coreName : String
var cloaked = false
var triggerAction = false

# Called when the node enters the scene tree for the first time.
func _ready():
	top_level = true
	GameManager.barrierDespawn($".".name)
	print("Setting Multiplayer Authority to " + str(str(GlobalVars.currentPlayer.name).to_int()) + " for player " + str(multiplayer.get_unique_id()))
	$MultiplayerSynchronizer.set_multiplayer_authority(str(GlobalVars.currentPlayer.name).to_int())
	if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		coreName = str(randi_range(0,9999999999))
		GlobalVars.currentScene = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func my_global_position(vec) -> void:
	self.global_position.x = vec.x
	self.global_position.y = vec.y



func _process(delta) -> void:
	if GlobalVars.leakError > 30 && GlobalVars.leakingFuel:
		if GlobalVars.Fuel > 4*delta:
			GlobalVars.Fuel -= 4*delta
		else:
			GlobalVars.Fuel = 0
	GlobalVars.leakError += delta
	triggerAction = false
	if randi_range(0,round(100000*delta)) == int(1) && GlobalVars.reliablility == 1:
		triggerAction = true
		print("yup")
	elif randi_range(0,round(200000*delta)) == int(1) && GlobalVars.reliablility == 2:
		triggerAction = true
	elif randi_range(0,round(300000*delta)) == int(1) && GlobalVars.reliablility == 3:
		triggerAction = true
	elif randi_range(0,round(400000*delta)) == int(1) && GlobalVars.reliablility == 4:
		triggerAction = true
	elif randi_range(0,round(500000*delta)) == int(1) && GlobalVars.reliablility == 5:
		triggerAction = true
	if triggerAction == true:
		if GlobalVars.inError == false:
			GlobalVars.errorType = randi_range(1,2)
			if GlobalVars.errorType == 1:
				GlobalVars.inError = true
				GlobalVars.highestVelocity = 0
				GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Ship aerodynamics compromised, in order to preserve ship speed keep cruising velocity under one hundred and fifty.wav")
				$ShipVoice.play()
			elif GlobalVars.errorType == 2:
				if GlobalVars.inStation == false:
					GlobalVars.leakError = 0
					GlobalVars.leakingFuel = true
					GlobalVars.inError = true
					GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Core fuel storage tank has a puncture, please return to station to make necessary repairs in the next 30 seconds or fuel will begin to leak.wav")
					$ShipVoice.play()
					
				else:
					GlobalVars.inError = false
			if GlobalVars.errorType == 3:
				GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
				GlobalVars.currentAudioPlayerShip.play()
				GlobalVars.inError = false
			if GlobalVars.errorType == 4:
				GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
				GlobalVars.currentAudioPlayerShip.play()
				GlobalVars.inError = false
	$nameLabel.z_index = 100
	if GlobalVars.inError:
		if GlobalVars.errorType == 1:
			if round((abs(GlobalVars.xVelocity)+abs(GlobalVars.yVelocity))/7) > 150:
				GlobalVars.inError = false
				GlobalVars.shipSpeedError += 0.12
				GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Aerodynamics wing is broken, ship speed multiplier has gone down by approximately two tenths.wav")
				$ShipVoice.play()
			if GlobalVars.errorType == 2:
				if GlobalVars.leakError > 30:
					GlobalVars.inError = false
					GlobalVars.leakingFuel = true
					GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Aerodynamics wing is broken, ship speed multiplier has gone down by approximately two tenths.wav")
					$ShipVoice.play()
	if blockHealth < 1:
		$Barrier/AnimatedSprite2D.visible = false
		$Barrier/CollisionPolygon2D.disabled = true
		$Barrier/CollisionPolygon2D2.disabled = true
	if self == GlobalVars.currentPlayer:
		$AudioListener2D.make_current()
		GlobalVars.currentAudioPlayerShip = $ShipVoice
		GlobalVars.currentSfxPlayerShip = $ShipSfx
	else:
		$Music.stop()
		$AudioListener2D.clear_current()
	GlobalVars.currentPlayer.global_position.x += GlobalVars.xVelocity * 1/GlobalVars.shipWeight * 50 * delta * GlobalVars.shipSpeedMultiplyer
	GlobalVars.currentPlayer.global_position.y -= GlobalVars.yVelocity * 1/GlobalVars.shipWeight * 50 * delta * GlobalVars.shipSpeedMultiplyer
	if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		globalPositionC = global_position
		mouseX = get_global_mouse_position().x
		mouseY = get_global_mouse_position().y
		globalMousePositionC = get_global_mouse_position()
	if $MultiplayerSynchronizer.get_multiplayer_authority() == multiplayer.get_unique_id():
		GlobalVars.currentPlayer = self
		if GlobalVars.gamePaused || GlobalVars.buildingEnabled:
			pass
		else:
			var v = get_global_mouse_position() - global_position
			var angle = v.angle()
			var r = global_rotation
			global_rotation = lerp_angle(r,angle, GlobalVars.turnSpeed)


		if Input.is_action_just_pressed("BPressed"):
			if GlobalVars.gamePaused == false:
				# If the game isn't Paused
				if GlobalVars.buildingEnabled:
					GlobalVars.buildingEnabled = false
				else:
					if GlobalVars.inStation:
						self.global_rotation = deg_to_rad(270)
						GlobalVars.placementRotation = deg_to_rad(0)
						GlobalVars.buildingEnabled = true
		if Input.is_action_just_pressed("EscapePressed"):
			if GlobalVars.gamePaused:
				GlobalVars.gamePaused = false  
			else:
				if GlobalVars.buildingEnabled:
					GlobalVars.buildingEnabled = false
				else:
					GlobalVars.gamePaused = true
			global_rotation = deg_to_rad(270)
