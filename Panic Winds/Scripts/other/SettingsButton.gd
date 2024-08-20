extends Button

func _process(delta):
	if GlobalVars.gamePaused:
		self.show()
	else:
		self.hide()
