extends Label
func _process(delta):
	if(GlobalVars.gamePaused):
		self.show()
	else:
		self.hide()
