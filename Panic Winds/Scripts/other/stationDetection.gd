extends Node2D

func _on_larger_area_area_entered(area):
	print("area entered")
	if GlobalVars.detectionDisabled == false:
		print("collided")
		if area.get_parent() == GlobalVars.currentPlayer:
			print("collided and passed")
			GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/ShipVoice/approachingStation.wav")
			GlobalVars.currentAudioPlayerShip.play()


func _on_larger_area_area_exited(area):
	GlobalVars.detectionDisabled = false
