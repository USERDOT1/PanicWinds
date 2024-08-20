extends RichTextLabel

func _process(delta):
	self.text = "Fuel %" + str(round(100*(GlobalVars.Fuel/GlobalVars.maxFuel))) + "\n Oxygen %" + str(round(100*(GlobalVars.Oxygen/GlobalVars.maxOxygen)))+ "\n Energy %" + str(round(100*(GlobalVars.Energy/GlobalVars.maxEnergy)))
	GlobalVars.Oxygen -= 0.3*delta
	if GlobalVars.Oxygen < 0:
		get_tree().quit()
	if (GlobalVars.Fuel > GlobalVars.maxFuel):
		GlobalVars.Fuel = GlobalVars.maxFuel
	if (GlobalVars.Energy > GlobalVars.maxEnergy):
		GlobalVars.Energy = GlobalVars.maxEnergy
	if (GlobalVars.Oxygen > GlobalVars.maxOxygen):
		GlobalVars.Oxygen = GlobalVars.maxOxygen
