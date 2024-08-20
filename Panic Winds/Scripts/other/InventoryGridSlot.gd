extends TextureRect
var slotId
var isMouseOver


func _enter_tree():
	pass
func  _ready():
	pass
func _process(delta):
	pass
func _on_mouse_entered():
	print("Over")
	isMouseOver = true
	print("mouse entered id recived: "+ str(slotId))
	$MouseOver.play()
	if slotId == 0:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Tier One Block"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Block Health: 100"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "20 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Block Health: 150\nBlock Armor: 10\nMass: 2"
	if slotId == 1:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Light Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Highly efficient minimal engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "7 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 1\nBlock Health: 60\nBlock Armor: 0\nMass: 0.4\nFuel Efficiency: 95\nThrust Power: 250"
	if slotId == 2:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Medium Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A standard engine favored by most pilots"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "30 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 1\nBlock Health: 90\nBlock Armor: 0\nMass: 0.95\nFuel Efficiency:90\nThrust Power: 400"
	if slotId == 3:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Heavy Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A large powerful, and heavily armored engine suited for larger ships"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "70 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 1\nBlock Health: 120\nBlock Armor: 25\nMass: 2.2\nFuel Efficiency: 80\nThrust Power: 600"
	if slotId == 4:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Light E Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A perfectly efficient and very light engine with very low power"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "10 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 1\nBlock Health: 50\nBlock Armor: 0\nMass: 0.3\nFuel Efficiency: 80\nThrust Power: 200"
	if slotId == 5:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Medium E Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A simple, reliable and perfecty efficient engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "45 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 1\nBlock Health: 80\nBlock Armor: 0\nMass: 0.6\nFuel Efficiency: 100\nThrust Power: 325"
	if slotId == 6:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Heavy E Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A powerful and highly efficient engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "100 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 1\nBlock Health: 85\nBlock Armor: 10\nMass: 0.7\nFuel Efficiency: 95\nThrust Power: 450"
	if slotId == 7:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Oxygen Engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A extremely risky and inneficient but insanely powerful engine"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "25 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 7\nBlock Health: 85\nBlock Armor: 0\nMass: 0.4\nFuel Efficiency: 50\nThrust Power: 1500"
	if slotId == 8:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Aegis"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A powerful sniper gun with high damage and penetration"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "25 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 2\nBlock Health: 100\nBlock Armor: 0\nMass: 0.5\nPower: 22\nAmmo: Heavy rounds\nFirerate: 2.5 rps\nPenetration: 30"
	if slotId == 9:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Trident"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "The splitting rounds catch even the most experienced pilots off gaurd and shred through lower armored nodes"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "30 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 2\nBlock Health: 110\nBlock Armor: 10\nMass: 0.5\nPower: 32\nAmmo: Light round\nFirerate: 2.5 rps *3\nPenetration: 0"
	if slotId == 10:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Buzzard"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A light automatic gun"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "50 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 2\nBlock Health: 40\nBlock Armor: 10\nMass: 0.8\nPower: 15\nAmmo: Light rounds\nFirerate: 10 rps\nPenetration: 0"
	if slotId == 11:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Fuel Generator"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Generates fuel when in idle, when active consumes energy and generates twice as much fuel"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "20 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 5\nBlock Health: 110\nBlock Armor: 12\nMass: 1.2"
	if slotId == 12:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Solar Panel"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Generates energy when in idle, can be disabled"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "15 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 9\nBlock Health: 25\nBlock Armor: 9\nMass: 0.8"
	if slotId == 13:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Homing Missile Launcher"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Homes to mouse cursor"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "25 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 3\nBlock Health: 100\nBlock Armor: 0\nMass: 0.7\nPower: 35\nAmmo: Missiles"
	if slotId == 14:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Heat Seeking Missile Launcher"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Homes to heat, such as engines/gun activity"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "25 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 3\nBlock Health: 100\nBlock Armor: 0\nMass: 0.7\nPower: 35\nAmmo: Missiles"
	if slotId == 15:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Fuel Tank"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Increses fuel storage"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "12 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 9\nBlock Health: 250\nBlock Armor: 0\nStorage: 90\nEject Rate: 35\nMass: 1.5"
	if slotId == 16:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Harvester"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A simple mining tool"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "40 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 4\nBlock Health: 85\nBlock Armor: 0\nMass: 0.7\nMining Delay: 1\nDecelleration Efficiencey: 80"
	if slotId == 17:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Optical Camera"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Extends player vision"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "50 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Block Health: 40\nBlock Armor: 0\nMass: 0.7\nVision Boost: 0.03"
	if slotId == 18:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Radar Antenna"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Adds a radar that can detect enemies out of sight"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "60 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 6\nBlock Health: 80\nBlock Armor: 30\nMass: 1"
	if slotId == 19:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Sheild Generator"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Generates a powerful shild to block bullets, but it is incredibly fragile"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "150 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Deafault Bind: 6\nBlock Health: 5\nBlock Armor: 0\nMass: 1"
	if slotId == 20:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Gyroscope"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "Allows you to rotate your ship faster"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "20 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Block Health: 40\nBlock Armor: 0\nMass: 0.7\nRotation Boost: 0.015"
	if slotId == 21:
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Name").text = "Cloaking Device"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Description").text = "A device that allows you to mostly conceal your ship"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Price").text = "80 creds"
		get_node("/root/MultiplayerGame/Players/" + GlobalVars.currentPlayer.name+"/currentCamera/buildingUi/Stats").text = "Block Health: 100\nBlock Armor: 0\nMass: 0.4"
	
func _input(event):
	if (Input.is_action_just_pressed("LeftClick")):
		
		if(isMouseOver):
			$Select.play()
			GlobalVars.currentBuildingUi.placementType = slotId
			GlobalVars.blockSelected = true
			
func _on_mouse_exited():
	isMouseOver = false
