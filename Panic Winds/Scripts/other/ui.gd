extends Control
var recordedValue
var direction
func _process(delta):
	if GlobalVars.inError:
		$ErrorText.visible = true
		if GlobalVars.errorType == 1:
			$ErrorText.text = "Keep speed below 150:\nHighest speed: " + str(GlobalVars.highestVelocity) + "\nCurrent speed: " + str(round((abs(GlobalVars.xVelocity)+abs(GlobalVars.yVelocity))/7)) + "  (Relative to station)"
		if GlobalVars.errorType == 2:
			if GlobalVars.leakError < 30:
				$ErrorText.text = "Time until fuel leak: " + str(round(30-GlobalVars.leakError))
			else:
				$ErrorText.text = "Fuel is leaking"
		if GlobalVars.errorType == 3:
			$ErrorText.text = ""
		if GlobalVars.errorType == 4:
			$ErrorText.text = ""
		$ErrorText.visible = true
	else:
		$ErrorText.visible = false
	self.global_position = GlobalVars.currentPlayer.global_position
	GlobalVars.roundStart -= delta
	if GlobalVars.roundStart > 0:
		$Countdown.text = "Round starts in: " + str(roundf(GlobalVars.roundStart))
	else:
		$Countdown.hide()
		$CountdownDisclamer.hide()
	if Input.is_action_just_pressed("UpArrow"):
		$ZoomSlider.value += 0.01
	if Input.is_action_just_pressed("DownArrow"):
		$ZoomSlider.value -= 0.01
	if GlobalVars.radarEnabled && GlobalVars.Energy > 1:
		$radarDisplay.visible = true
	else:
		$radarDisplay.visible = false
	$".".visible = true
	if !GlobalVars.buildingEnabled:
		$ZoomSlider.visible = true
		GlobalVars.currentCamera.zoom = Vector2($ZoomSlider.value,$ZoomSlider.value)
	else:
		$ZoomSlider.visible = false
	self.scale = Vector2(1/(GlobalVars.currentCamera.zoom.x*10),1/(GlobalVars.currentCamera.zoom.y*10))
	z_index = 100
	GlobalVars.Oxygen -= 0.2*delta
	if GlobalVars.Fuel > GlobalVars.maxFuel:
		GlobalVars.Fuel = GlobalVars.maxFuel
	if GlobalVars.Energy > GlobalVars.maxEnergy:
		GlobalVars.Energy = GlobalVars.maxEnergy
	if GlobalVars.Oxygen > GlobalVars.maxOxygen:
		GlobalVars.Oxygen = GlobalVars.maxOxygen
	if GlobalVars.Oxygen < 0:
		$OxygenDeath.visible = true
	if round((abs(GlobalVars.xVelocity)+abs(GlobalVars.yVelocity))/7) > GlobalVars.highestVelocity:
		GlobalVars.highestVelocity = round((abs(GlobalVars.xVelocity)+abs(GlobalVars.yVelocity))/7)
	$Resources.text = ("Fuel: %"+str(round(100*(GlobalVars.Fuel/GlobalVars.maxFuel)))+" or "+str(round(GlobalVars.Fuel))+" Tonnes of fuel"+"\nEnergy: %"+str(round(100*(GlobalVars.Energy/GlobalVars.maxEnergy)))+" or "+str(round(GlobalVars.Energy))+" Gigawatts of energy"+"\nOxygen: %"+str(round(100*(GlobalVars.Oxygen/GlobalVars.maxOxygen)))+" or "+str(round(GlobalVars.Oxygen))+" Liters of Oxygen")
	$Creds.text = "Creds: "+ str(GlobalVars.creds)
	$Ammo.text = ("Light Rounds: "+str(GlobalVars.lightRounds)+"\nHeavy Rounds: "+str(GlobalVars.heavyRounds)+"\nMissiles: "+str(GlobalVars.missiles))
	if abs(GlobalVars.xVelocity) > abs(GlobalVars.yVelocity):
		if GlobalVars.xVelocity > 0:
			direction = "East"
		else:
			direction = "West"
	else:
		if GlobalVars.yVelocity > 0:
			direction = "North"
		else:
			direction = "South"
	$Velocity.text = "Velocity: Mach " + str(round((abs(GlobalVars.xVelocity)+abs(GlobalVars.yVelocity))/7)) + " " + direction + "\n" + "(Relative to nearest station)"
	$"Core Health".text = "Core Health: "+ str(round(GlobalVars.coreHealth))
	

func _on_settings_pressed():
	GlobalVars.currentPauseMenu.show()


func _on_button_pressed():
	GlobalVars.currentShipModelMenu.show()
