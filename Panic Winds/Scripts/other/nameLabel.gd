extends Label

func _process(delta):
	if $".." == GlobalVars.currentPlayer:
		$".".text = GlobalVars.playerName
	if $"..".cloaked:
		self.hide()
	else:
		self.show()
