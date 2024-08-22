extends Node

var multiplayerPlayers = {}
var instance
@onready var teirOneBlock = load("res://Scenes/Ship/teir_one_block.tscn")
@onready var engine = load("res://Scenes/Ship/engine.tscn")
@onready var gunTest = load("res://Scripts/gun_test.tscn")
@onready var fuelGenerator = load("res://Scenes/Ship/fuel_generator.tscn")
@onready var homingRocketLauncher = load("res://Scenes/Ship/homing_rocket_launcher.tscn")
@onready var lightEngine = load("res://Scenes/Ship/lightEngine.tscn")
@onready var heavyEngine = load("res://Scenes/Ship/heavyEngine.tscn")
@onready var lightEEngine = load("res://Scenes/Ship/lightEEngine.tscn")
@onready var mediumEEngine = load("res://Scenes/Ship/mediumEEngine.tscn")
@onready var heavyEEngine = load("res://Scenes/Ship/heavyEEngine.tscn")
@onready var oxygenEngine = load("res://Scenes/Ship/oxygenEngine.tscn")
@onready var trident = load("res://Scenes/Ship/trident.tscn")
@onready var harvester = load("res://Scenes/Ship/harvester.tscn")
@onready var heatSeekingMissileLauncher = load("res://Scenes/Ship/heat_seeking_missile_launcher.tscn")
@onready var fuelTank = load("res://Scenes/Ship/fuelTank.tscn")
@onready var solarPanel = load("res://Scenes/Ship/solarPanel.tscn")
@onready var opticalCamera = load("res://Scenes/Ship/optical_camera.tscn")
@onready var radarAntenna = load("res://Scenes/Ship/radarAntenna.tscn")
@onready var buzzard = load("res://Scripts/buzzard.tscn")
@onready var sheildGenerator = load("res://Scenes/Ship/sheildGenerator.tscn")
@onready var gyroscope = load("res://Scenes/Ship/gyroscope.tscn")
@onready var cloakingDevice = load("res://Scenes/Ship/cloakingDevice.tscn")

@rpc("any_peer")
func sendPlayerInfo(name,id):
	print("Called send player for id" + str(id) + " from " + str(multiplayer.get_unique_id()))
	if !GameManager.multiplayerPlayers.has(id):
		GameManager.multiplayerPlayers[id] = {
			"name": name,
			"id": id,
			"score": 0
		}
	if multiplayer.is_server():
		for i in GameManager.multiplayerPlayers:
			sendPlayerInfo.rpc(GameManager.multiplayerPlayers[i].name, i)

@rpc("any_peer","call_local")
func startGameInitiate() -> void:
	print("Called Start Game from " + str(multiplayer.get_unique_id()))
	get_tree().root.get_child(2).hide()
	var scene = load("res://Scenes/multiplayer_game.tscn").instantiate()
	get_tree().root.add_child(scene)
	
@rpc("any_peer","call_local", "reliable")
func createBlock(playerid, placementType, lolposition, placementRotation, playerRotation, playerGlobalPosition, randID, placementCount, placementCoords) -> void:
	if(placementType == 0):
		instance = teirOneBlock.instantiate()
	if(placementType == 1):
		instance = lightEngine.instantiate()
	if(placementType == 2):
		instance = engine.instantiate()
	if(placementType == 3):
		instance = heavyEngine.instantiate()
	if(placementType == 4):
		instance = lightEEngine.instantiate()
	if(placementType == 5):
		instance = mediumEEngine.instantiate()
	if(placementType == 6):
		instance = heavyEEngine.instantiate()
	if(placementType == 7):
		instance = oxygenEngine.instantiate()
	if(placementType == 8):
		instance = gunTest.instantiate()
	if(placementType == 9):
		instance = trident.instantiate()
	if(placementType == 10):
		instance = buzzard.instantiate()
	if(placementType == 11):
		instance = fuelGenerator.instantiate()
	if(placementType == 12):
		instance = solarPanel.instantiate()
	if(placementType == 13):
		instance = homingRocketLauncher.instantiate()
	if(placementType == 14):
		instance = heatSeekingMissileLauncher.instantiate()
	if(placementType == 15):
		instance = fuelTank.instantiate()
	if(placementType == 16):
		instance = harvester.instantiate()
	if(placementType == 17):
		instance = opticalCamera.instantiate()
	if(placementType == 18):
		instance = radarAntenna.instantiate()
	if(placementType == 19):
		instance = sheildGenerator.instantiate()
	if(placementType == 20):
		instance = gyroscope.instantiate()
	if(placementType == 21):
		instance = cloakingDevice.instantiate()
	instance.spawnPosition = Vector2(round(lolposition.x/640)*640,round(lolposition.y/640)*640) + playerGlobalPosition
	instance.spawnRotation = rad_to_deg(playerRotation + placementRotation)
	instance.spawnName = randID
	instance.listCoords = placementCoords
	var buildingPlayer = null
	for i in GlobalVars.PlayersNode.get_child_count():
		if GlobalVars.PlayersNode.get_child(i).name == playerid:
			buildingPlayer = GlobalVars.PlayersNode.get_child(i)
	buildingPlayer.add_child(instance)
	instance.playerOwner = buildingPlayer
	if instance.playerOwner == GlobalVars.currentPlayer:
		if placementType == 0:
			GlobalVars.buildingBlocks.append(Vector2(round(lolposition.x/640),round(lolposition.y/640)))
		GlobalVars.placedBlocks.append(Vector2(round(lolposition.x/640),round(lolposition.y/640)))
	GlobalVars.shipWeight += instance.blockWeight
	GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/coins.wav")
	GlobalVars.currentAudioPlayerShip.play()

@rpc("any_peer","call_local", "reliable")
func destroyObject(owner,blockid, playerid, listCoords, isBuildingBlock, weight):
	var playerOwner = null
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		for j in GlobalVars.PlayersNode.get_child(i).get_child_count():
			playerOwner = GlobalVars.PlayersNode.get_child(i)
			if playerOwner.get_child(j).name == blockid:
				#if it's id is equal to the destruction id
				#destroy it
				playerOwner.get_child(j).queue_free()
				GlobalVars.placedBlocks.erase(listCoords)
				if isBuildingBlock:
					GlobalVars.buildingBlocks.erase(listCoords)
				if playerid == GlobalVars.currentPlayer.name:
					GlobalVars.shipWeight -= weight

@rpc("any_peer","call_local", "reliable")
func coreDestroy(playerID, coreName):
	var playerOwner = null
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		if GlobalVars.PlayersNode.get_child(i).name == playerID:
			playerOwner = GlobalVars.PlayersNode.get_child(i)
			for j in playerOwner.get_child_count():
				if playerOwner.get_child(j).name == coreName:
					#if it's id is equal to the destruction id
					#destroy it
					playerOwner.get_child(j).visible = false
					for g in playerOwner.get_child(j).get_child_count():
						if playerOwner.get_child(j).get_child(g).name == "CoreCollision":
							playerOwner.get_child(j).get_child(g).queue_free()
					GlobalVars.placedBlocks.erase(Vector2(0,0))
					GlobalVars.buildingBlocks.erase(Vector2(0,0))
				else:
					if playerOwner.get_child(j).name != "MultiplayerSynchronizer" && playerOwner.get_child(j).name != "ShipArea" && playerOwner.get_child(j).name != "AudioListener2D" && playerOwner.get_child(j).name != "AudioStreamPlayer2D" && playerOwner.get_child(j).name != "Music" && playerOwner.get_child(j).name != "Barrier" && playerOwner.get_child(j).name != "currentCamera" && playerOwner.get_child(j).name != "nameLabel":
						playerOwner.get_child(j).queue_free()
@rpc("any_peer","call_local")
func spawnProjectile(projectilePath, playerRotation, selfRotation, globalPosition, xVelocity, yVelocity, playerID, playerPower, penetration):
	print("spawningProjectile")
	var projectile = load(projectilePath)
	var instance = projectile.instantiate()
	instance.direction = playerRotation + selfRotation
	instance.playerPower = playerPower
	instance.spawnPosition = globalPosition
	instance.spawnRotation = playerRotation
	instance.zIndex = -10
	instance.shipVelocity = Vector2(xVelocity* 1/GlobalVars.shipWeight * 0.5,yVelocity* 1/GlobalVars.shipWeight * 0.5)
	instance.penetration = penetration
	var firingPlayer
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		if GlobalVars.PlayersNode.get_child(i).name == playerID:
			#find the firiring player could be not the main character
			firingPlayer = GlobalVars.PlayersNode.get_child(i)
	instance.playerOwner = firingPlayer
	GlobalVars.get_node("/root/MultiplayerGame").add_child(instance)
		
		
		
@rpc("any_peer","call_local", "reliable")
func barrierSpawn(playerid):
	print("SPAWN BARRIER")
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		if GlobalVars.PlayersNode.get_child(i).name == playerid:
			for j in GlobalVars.PlayersNode.get_child(i).get_child_count():
				if GlobalVars.PlayersNode.get_child(i).get_child(j).name == "Barrier":
					for b in GlobalVars.PlayersNode.get_child(i).get_child(j).get_child_count():
						if GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).name == "CollisionPolygon2D":
							GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).disabled = false
						if GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).name == "CollisionPolygon2D2":
							GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).disabled = false
						if GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).name == "AnimatedSprite2D":
							GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).visible = true


@rpc("any_peer","call_local", "reliable")
func barrierDespawn(playerid):
	print("SPAWN BARRIER")
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		if GlobalVars.PlayersNode.get_child(i).name == playerid:
			for j in GlobalVars.PlayersNode.get_child(i).get_child_count():
				if GlobalVars.PlayersNode.get_child(i).get_child(j).name == "Barrier":
					for b in GlobalVars.PlayersNode.get_child(i).get_child(j).get_child_count():
						if GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).name == "CollisionPolygon2D":
							GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).disabled = true
						if GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).name == "CollisionPolygon2D2":
							GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).disabled = true
						if GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).name == "AnimatedSprite2D":
							GlobalVars.PlayersNode.get_child(i).get_child(j).get_child(b).visible = false
@rpc("any_peer","call_local","reliable")
func cloak(playerCloakID):
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		if GlobalVars.PlayersNode.get_child(i).name == playerCloakID:
			GlobalVars.PlayersNode.get_child(i).cloaked = true


	
@rpc("any_peer","call_local","reliable")
func unCloak(playerCloakID):
	for i in GlobalVars.PlayersNode.get_child_count():
		#for every player
		if GlobalVars.PlayersNode.get_child(i).name == playerCloakID:
			GlobalVars.PlayersNode.get_child(i).cloaked = false
