extends Node2D

func _on_larger_area_area_entered(area):
	if GlobalVars.detectionDisabled == false:
		if area.get_parent() == GlobalVars.currentPlayer:
			GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/approachingStation.wav")
			GlobalVars.currentAudioPlayerShip.play()


func _on_larger_area_area_exited(area):
	GlobalVars.detectionDisabled = false
