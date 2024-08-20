extends Node2D
@export var playerScene: PackedScene
@export var camera: PackedScene
@export var buildingUi: PackedScene
@export var station: PackedScene
@export var stationDetection: PackedScene
var energyDangerouslyLow = false
var energyLow = false
var fuelDangerouslyLow = false
var fuelLow = false
var oxygenDangerouslyLow = false
var oxygenLow = false
var outOfOxygen = false
var Camera
var selected
var timer = 0
var creditTime = 1

func _ready():
	$UI.show()
	GlobalVars.PlayersNode = $Players
	GlobalVars.currentScene = self
	var index = 0
	for i in GlobalVars.stationNumber:
		var stationL = station.instantiate()
		var stationDetectionL = stationDetection.instantiate()
		$".".add_child(stationL)
		$".".add_child(stationDetectionL)
		
		for spawn in get_tree().get_nodes_in_group("playerSpawnPoint"):
			if spawn.name == str(index):
				stationL.global_position = spawn.global_position
				stationDetectionL.global_position = spawn.global_position
		index += 1
		
	index = 0
	for i in GameManager.players:
		GlobalVars.currentPlayer = playerScene.instantiate()
		
		GlobalVars.currentPlayer.name = str(GameManager.players[i].id)
		Camera = camera.instantiate()
		GlobalVars.currentBuildingUi = buildingUi.instantiate()
		GlobalVars.currentBuildingUi.name = "buildingUi"
		$Players.add_child(GlobalVars.currentPlayer)
		Camera.global_position = GlobalVars.currentPlayer.global_position
		GlobalVars.currentPlayer.add_child(Camera)
		Camera.enabled = true
		Camera.name = "currentCamera"
		Camera.add_child(GlobalVars.currentBuildingUi)
		for spawn in get_tree().get_nodes_in_group("playerSpawnPoint"):
			if spawn.name == str(index):
				
				print("Spawn Location for player " + str(index) + "for User ID: " + str(multiplayer.get_unique_id()) + ": " + str(spawn.global_position))
				print("Current Location for player " +str(multiplayer.get_unique_id()) + ": " + str(GlobalVars.currentPlayer.global_position))
				GlobalVars.currentPlayer.my_global_position(spawn.global_position)
		if GameManager.players[i].id == multiplayer.get_unique_id():
			Camera.make_current()
			GlobalVars.currentCamera = Camera
			
		index += 1
func _process(delta):
	if timer > creditTime:
		timer = delta
		GlobalVars.creds += 1
	else:
		timer += delta
	if GlobalVars.Energy < 10 && energyDangerouslyLow == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Energy dangerously low, ship functions might be impaired.wav")
		GlobalVars.currentAudioPlayerShip.play()
		energyDangerouslyLow = true
	if GlobalVars.Energy >10 && energyDangerouslyLow == true:
		energyDangerouslyLow = false
	if GlobalVars.Energy < 30 && energyLow == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Energy is running low, recharging might be necessary.wav")
		GlobalVars.currentAudioPlayerShip.play()
		energyLow = true
	if GlobalVars.Energy > 30 && energyLow == true:
		energyLow = false
		
		
	if GlobalVars.Fuel < 10 && fuelDangerouslyLow == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Fuel dangerously low, please refill immediately.wav")
		GlobalVars.currentAudioPlayerShip.play()
		fuelDangerouslyLow = true
	if GlobalVars.Fuel > 10 && fuelDangerouslyLow == true:
		fuelDangerouslyLow = false
	if GlobalVars.Fuel < 30 && fuelLow == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Fuel is running low, refill may be necessary.wav")
		GlobalVars.currentAudioPlayerShip.play()
		fuelLow = true
	if GlobalVars.Fuel > 30 && fuelLow == true:
		fuelLow = false
		
	if GlobalVars.Oxygen < 2 && outOfOxygen == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Out of oxygen. pilot death imminent.wav")
		GlobalVars.currentAudioPlayerShip.play()
		outOfOxygen = true
	if GlobalVars.Oxygen > 2 && outOfOxygen == true:
		outOfOxygen = false
	if GlobalVars.Oxygen < 15 && oxygenDangerouslyLow == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Oxygen dangerously low, pilot safety in jeopardy, refill oxygen immediately.wav")
		GlobalVars.currentAudioPlayerShip.play()
		oxygenDangerouslyLow = true
	if GlobalVars.Oxygen > 15 && oxygenDangerouslyLow == true:
		oxygenDangerouslyLow = false
	if GlobalVars.Oxygen < 30 && oxygenLow == false:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/Oxygen is running low, refill may be necessary.wav")
		GlobalVars.currentAudioPlayerShip.play()
		oxygenLow = true
	if GlobalVars.Oxygen > 30 && oxygenLow == true:
		oxygenLow = false
 


func _on_area_2d_area_exited(area):
	if area.get_parent() == GlobalVars.currentPlayer:
		GlobalVars.currentPlayer.global_position = Vector2(randf_range(-10000,10000),randf_range(-10000,10000))
		GlobalVars.xVelocity = 0
		GlobalVars.yVelocity = 0
		GlobalVars.detectionDisabled = true
