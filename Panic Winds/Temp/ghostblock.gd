extends Node2D
@onready var teirOneBlock = load("res://Scenes/Ship/teir_one_block.tscn")
@onready var engine = load("res://Scenes/Ship/engine.tscn")
@onready var gun = load("res://Scenes/Ship/gun_test.tscn")
@onready var fuelGenerator = load("res://Scenes/Ship/fuel_generator.tscn")
@onready var homingRocketLauncher = load("res://Scenes/Ship/homing_rocket_launcher.tscn")
var lolposition = 0
var blockPositions : Dictionary
var instance = null
var weight = 0
var spawnName : String
var placementCoords
var placementCount
var cost
var possibleBlocks = []
var surroundBlocks = []

func _process(_delta):
	$"../ghostBlockSprite".scale = Vector2(GlobalVars.currentCamera.zoom.x*10,GlobalVars.currentCamera.zoom.y*10)
	global_position = Vector2(0,0)
	if GlobalVars.currentPlayer.name == get_parent().get_parent().get_parent().name:
		if !GlobalVars.gamePaused && GlobalVars.buildingEnabled && GlobalVars.inStation:
			if(GlobalVars.currentBuildingUi.placementType == 0):
				$"../ghostBlockSprite".animation = "teir_one_block"
				cost = 20
			if(GlobalVars.currentBuildingUi.placementType == 1):
				$"../ghostBlockSprite".animation = "light_engine"
				cost = 7
			if(GlobalVars.currentBuildingUi.placementType == 2):
				$"../ghostBlockSprite".animation = "engine_test"
				cost = 30
			if(GlobalVars.currentBuildingUi.placementType == 3):
				$"../ghostBlockSprite".animation = "heavy_engine"
				cost = 70
			if(GlobalVars.currentBuildingUi.placementType == 4):
				$"../ghostBlockSprite".animation = "light_e_engine"
				cost = 10
			if(GlobalVars.currentBuildingUi.placementType == 5):
				$"../ghostBlockSprite".animation = "medium_e_engine"
				cost = 45
			if(GlobalVars.currentBuildingUi.placementType == 6):
				$"../ghostBlockSprite".animation = "heavy_e_engine"
				cost = 100
			if(GlobalVars.currentBuildingUi.placementType == 7):
				$"../ghostBlockSprite".animation = "oxygen_engine"
				cost = 25
			if(GlobalVars.currentBuildingUi.placementType == 8):
				$"../ghostBlockSprite".animation = "gun_test"
				cost = 25
			if(GlobalVars.currentBuildingUi.placementType == 9):
				$"../ghostBlockSprite".animation = "trident"
				cost = 30
			if(GlobalVars.currentBuildingUi.placementType == 10):
				$"../ghostBlockSprite".animation = "buzzard"
				cost = 50
			if(GlobalVars.currentBuildingUi.placementType == 11):
				$"../ghostBlockSprite".animation = "fuel_generator"
				cost = 20
			if(GlobalVars.currentBuildingUi.placementType == 12):
				$"../ghostBlockSprite".animation = "solar_panel"
				cost = 15
			if(GlobalVars.currentBuildingUi.placementType == 13):
				$"../ghostBlockSprite".animation = "homing_rocket_launcher"
				cost = 25
			if(GlobalVars.currentBuildingUi.placementType == 14):
				$"../ghostBlockSprite".animation = "heat_seeking_rocket_launcher"
				cost = 25
			if(GlobalVars.currentBuildingUi.placementType == 15):
				$"../ghostBlockSprite".animation = "fuel_tank_blank"
				cost = 12
			if(GlobalVars.currentBuildingUi.placementType == 16):
				$"../ghostBlockSprite".animation = "harvester"
				cost = 40
			if(GlobalVars.currentBuildingUi.placementType == 17):
				$"../ghostBlockSprite".animation = "optical_camera"
				cost = 50
			if(GlobalVars.currentBuildingUi.placementType == 18):
				$"../ghostBlockSprite".animation = "radar_antenna"
				cost = 60
			if(GlobalVars.currentBuildingUi.placementType == 19):
				$"../ghostBlockSprite".animation = "sheild_generator"
				cost = 150
			if(GlobalVars.currentBuildingUi.placementType == 20):
				$"../ghostBlockSprite".animation = "gyroscope"
				cost = 20
			if(GlobalVars.currentBuildingUi.placementType == 21):
				$"../ghostBlockSprite".animation = "cloakingDevice"
				cost = 80
			if(Input.is_action_just_pressed("QPressed")):
				print("Qpressed:" + str(rad_to_deg(GlobalVars.currentBuildingUi.placementRotation)))
				GlobalVars.currentBuildingUi.placementRotation += deg_to_rad(-90)
			if(Input.is_action_just_pressed("EPressed")):
				print("Epressed:" + str(rad_to_deg(GlobalVars.currentBuildingUi.placementRotation)))
				GlobalVars.currentBuildingUi.placementRotation += deg_to_rad(90)
			
			if !((get_global_mouse_position().x < GlobalVars.currentPlayer.global_position.x- (3000 * 1/(GlobalVars.currentCamera.zoom.x*10)) || get_global_mouse_position().x > GlobalVars.currentPlayer.global_position.x+ (3000 * 1/(GlobalVars.currentCamera.zoom.x*10))) || (get_global_mouse_position().y > GlobalVars.currentPlayer.global_position.y+(3000 * 1/(GlobalVars.currentCamera.zoom.y*10)) || get_global_mouse_position().y < GlobalVars.currentPlayer.global_position.y- (3000 * 1/(GlobalVars.currentCamera.zoom.y*10)))) && GlobalVars.blockSelected:
				$"../ghostBlockSprite".visible = true
				$"../ghostBlockSprite".modulate.a = 0.5
			else:
				$"../ghostBlockSprite".visible = false
		else:
			$"../ghostBlockSprite".visible = false
		lolposition = get_global_mouse_position()
		lolposition -= GlobalVars.currentPlayer.global_position
		if rad_to_deg(GlobalVars.currentBuildingUi.placementRotation) >= 360:
				GlobalVars.currentBuildingUi.placementRotation -= deg_to_rad(360)
		if rad_to_deg(GlobalVars.currentBuildingUi.placementRotation) <= -90:
			GlobalVars.currentBuildingUi.placementRotation += deg_to_rad(360)
		
		possibleBlocks = []
		surroundBlocks = []
		for b in GlobalVars.buildingBlocks:
			if GlobalVars.currentBuildingUi.placementRotation == deg_to_rad(0):
				possibleBlocks.append(b + Vector2(-1,0))
			if GlobalVars.currentBuildingUi.placementRotation == deg_to_rad(90):
				possibleBlocks.append(b + Vector2(0,-1))
			if GlobalVars.currentBuildingUi.placementRotation == deg_to_rad(180):
				possibleBlocks.append(b + Vector2(1,0))
			if GlobalVars.currentBuildingUi.placementRotation == deg_to_rad(270):
				possibleBlocks.append(b + Vector2(0,1))
		for f in GlobalVars.buildingBlocks:
			surroundBlocks.append(f + Vector2(-1,0))
			surroundBlocks.append(f + Vector2(1,0))
			surroundBlocks.append(f + Vector2(0,-1))
			surroundBlocks.append(f + Vector2(0,1))




		if !(GlobalVars.placedBlocks.has(Vector2(round(lolposition.x/640),round(lolposition.y/640)))):
			#Not ON block
			$"../ghostBlockSprite".global_position = Vector2(round(lolposition.x/640)*640,round(lolposition.y/640)*640) + GlobalVars.currentPlayer.global_position
			if GlobalVars.currentBuildingUi.placementType != 0:
				#NOT A BUILDING BLOCK
				if (possibleBlocks.has(Vector2(round(lolposition.x/640),round(lolposition.y/640)))):
					$"../ghostBlockSprite".modulate.g = 1
					$"../ghostBlockSprite".modulate.b = 1
				else:
					$"../ghostBlockSprite".modulate.g = 0.5
					$"../ghostBlockSprite".modulate.b = 0.5
			else:
				#BUILDING BLOCK
				if surroundBlocks.has(Vector2(round(lolposition.x/640),round(lolposition.y/640))):
					$"../ghostBlockSprite".modulate.g = 1
					$"../ghostBlockSprite".modulate.b = 1
				else:
					$"../ghostBlockSprite".modulate.g = 0.5
					$"../ghostBlockSprite".modulate.b = 0.5
		else:
			#On BLOCK
			pass
		$"../ghostBlockSprite".global_rotation = GlobalVars.currentPlayer.rotation + GlobalVars.currentBuildingUi.placementRotation
		placementCoords = Vector2(round(lolposition.x/640),round(lolposition.y/640))
		placementCount = len(GlobalVars.placedBlocks)



		if(Input.is_action_just_pressed("LeftClick") && !GlobalVars.gamePaused && GlobalVars.buildingEnabled && GlobalVars.blockSelected && GlobalVars.inStation&& !((get_global_mouse_position().x < GlobalVars.currentPlayer.global_position.x- (3000 * 1/(GlobalVars.currentCamera.zoom.x*10)) || get_global_mouse_position().x > GlobalVars.currentPlayer.global_position.x+ (3000 * 1/(GlobalVars.currentCamera.zoom.x*10))) || (get_global_mouse_position().y > GlobalVars.currentPlayer.global_position.y+(3000 * 1/(GlobalVars.currentCamera.zoom.y*10)) || get_global_mouse_position().y < GlobalVars.currentPlayer.global_position.y- (3000 * 1/(GlobalVars.currentCamera.zoom.y*10))))):
			print("ye?")
			GlobalVars.blockSelected = false
			if !(GlobalVars.placedBlocks.has(Vector2(round(lolposition.x/640),round(lolposition.y/640)))):
				if GlobalVars.currentBuildingUi.placementType != 0:
					if (possibleBlocks.has(Vector2(round(lolposition.x/640),round(lolposition.y/640)))):
						if GlobalVars.creds >= cost:
							GlobalVars.creds -= cost
							GameManager.createBlock.rpc(GlobalVars.currentPlayer.name, GlobalVars.currentBuildingUi.placementType, lolposition, GlobalVars.currentBuildingUi.placementRotation, GlobalVars.currentPlayer.rotation, GlobalVars.currentPlayer.global_position, str(round(randf_range(1,1000000000))), placementCount, placementCoords)
						else:
							print("Can't afford ERROR")
							GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
							GlobalVars.currentAudioPlayerShip.play()
					else:
						print("Not a possible block ERROR")
						GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
						GlobalVars.currentAudioPlayerShip.play()
				else:
					if (surroundBlocks.has(Vector2(round(lolposition.x/640),round(lolposition.y/640)))):
						if GlobalVars.creds >= cost:
							GlobalVars.creds -= cost
							GameManager.createBlock.rpc(GlobalVars.currentPlayer.name, GlobalVars.currentBuildingUi.placementType, lolposition, GlobalVars.currentBuildingUi.placementRotation, GlobalVars.currentPlayer.rotation, GlobalVars.currentPlayer.global_position, str(round(randf_range(1,1000000000))), placementCount, placementCoords)
						else:
							print("Can't afford ERROR")
							GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
							GlobalVars.currentAudioPlayerShip.play()
					else:
						print("Not a surrounding block ERROR")
						GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
						GlobalVars.currentAudioPlayerShip.play()
			else:
				print("On Block ERROR")
				GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
				GlobalVars.currentAudioPlayerShip.play()

