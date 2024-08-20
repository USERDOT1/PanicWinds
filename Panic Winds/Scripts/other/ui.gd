extends Control
var recordedValue
func _process(delta):
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
		get_tree().quit()
	$Resources.text = ("Fuel: %"+str(round(100*(GlobalVars.Fuel/GlobalVars.maxFuel)))+" or "+str(round(GlobalVars.Fuel))+" Tons of fuel"+"\nEnergy: %"+str(round(100*(GlobalVars.Energy/GlobalVars.maxEnergy)))+" or "+str(round(GlobalVars.Energy))+" Gigawatts of energy"+"\nOxygen: %"+str(round(100*(GlobalVars.Oxygen/GlobalVars.maxOxygen)))+" or "+str(round(GlobalVars.Oxygen))+" Liters of Oxygen")
	$Creds.text = "Creds: "+ str(GlobalVars.creds)
	$Ammo.text = ("Light Rounds: "+str(GlobalVars.lightRounds)+"\nHeavy Rounds: "+str(GlobalVars.heavyRounds)+"\nMissiles: "+str(GlobalVars.missiles))
	$Velocity.text = "Velocity: " + str(round(abs(GlobalVars.xVelocity)+abs(GlobalVars.yVelocity)))
	$"Core Health".text = "Core Health: "+ str(round(GlobalVars.coreHealth))
	self.global_position = GlobalVars.currentPlayer.global_position


func _on_settings_pressed():
	GlobalVars.currentPauseMenu.show()


func _on_button_pressed():
	GlobalVars.currentShipModelMenu.show()
