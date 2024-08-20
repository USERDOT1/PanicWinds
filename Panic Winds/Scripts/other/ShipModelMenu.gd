extends Popup

func _ready():
	if get_parent().get_parent() == GlobalVars.currentPlayer:
		GlobalVars.currentShipModelMenu = self
