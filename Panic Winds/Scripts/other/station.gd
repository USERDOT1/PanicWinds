extends Node2D
var looping = false
var multiplyer

func _enter_tree():
	z_index = -1

	
func _process(delta):
	if Input.is_action_pressed("Shift"):
		multiplyer = 5
		$"Station UI/Buy Light Round".text = "Buy Light Round x5"
		$"Station UI/Buy Heavy Round".text = "Buy Heavy Round x5"
		$"Station UI/Buy Missile".text = "Buy Missile x5"
	else:
		multiplyer = 1
		$"Station UI/Buy Light Round".text = "Buy Light Round"
		$"Station UI/Buy Heavy Round".text = "Buy Heavy Round"
		$"Station UI/Buy Missile".text = "Buy Missile"
	if GlobalVars.inStation && !GlobalVars.buildingEnabled:
		$"Station UI".visible = true
		
	if GlobalVars.inStation:
		if GlobalVars.Fuel < GlobalVars.maxFuel:
			if GlobalVars.Fuel + delta < GlobalVars.maxFuel:
				GlobalVars.Fuel += delta
			else:
				GlobalVars.Fuel = GlobalVars.maxFuel
		if GlobalVars.Energy < GlobalVars.maxEnergy:
			if GlobalVars.Energy + delta < GlobalVars.maxEnergy:
				GlobalVars.Energy += delta
			else:
				GlobalVars.Energy = GlobalVars.maxEnergy
		if GlobalVars.Oxygen < GlobalVars.maxOxygen:
			if GlobalVars.Oxygen + delta < GlobalVars.maxOxygen:
				GlobalVars.Oxygen += delta
			else:
				GlobalVars.Oxygen = GlobalVars.maxOxygen
		GlobalVars.xVelocity = GlobalVars.xVelocity/(1+(0.3*delta))
		GlobalVars.yVelocity = GlobalVars.yVelocity/(1+(0.3*delta))
	else:
		$"Station UI".visible = false
		pass


func _on_player_area_area_entered(area):
	if area.get_parent() == GlobalVars.currentPlayer:
		$AudioStreamPlayer2D.play()
		GlobalVars.inStation = true
		print(abs(GlobalVars.xVelocity) + abs(GlobalVars.yVelocity))
		$AnimatedSprite2D/AnimationPlayer.play("FuelUp")


func _on_player_area_area_exited(area):
	if area.get_parent() == GlobalVars.currentPlayer:
		$AudioStreamPlayer2D.stop()
		GlobalVars.inStation = false
		$AnimatedSprite2D/AnimationPlayer.play_backwards("FuelUp")


func _on_buy_light_round_pressed():
	if GlobalVars.creds >= 2*multiplyer:
		GlobalVars.creds -= 2*multiplyer
		GlobalVars.lightRounds += multiplyer
	else:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
		GlobalVars.currentAudioPlayerShip.play()


func _on_buy_heavy_round_pressed():
	if GlobalVars.creds >= 5*multiplyer:
		GlobalVars.creds -= 5*multiplyer
		GlobalVars.heavyRounds += multiplyer
	else:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
		GlobalVars.currentAudioPlayerShip.play()


func _on_buy_missile_button_up():
	if GlobalVars.creds >= 60*multiplyer:
		GlobalVars.creds -= 60*multiplyer
		GlobalVars.missiles += multiplyer
	else:
		GlobalVars.currentAudioPlayerShip.stream = load("res://Assets/Sound/SoundEffects/CantBuy.wav")
		GlobalVars.currentAudioPlayerShip.play()


func _on_audio_stream_player_2d_finished():
		$AudioStreamPlayer2D.play(2.97)
