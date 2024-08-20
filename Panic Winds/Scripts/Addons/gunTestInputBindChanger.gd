extends Area2D
func _input_event(_veiwport, event, _shape_idx):
	if $"..".playerOwner == GlobalVars.currentPlayer:
		if event.is_action_pressed("LeftClick"):
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputTwo"
				$"../GunTestSprite".animation = "GunBindTwo"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputThree"
				$"../GunTestSprite".animation = "GunBindThree"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputFour"
				$"../GunTestSprite".animation = "GunBindFour"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputFive"
				$"../GunTestSprite".animation = "GunBindFive"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputSix"
				$"../GunTestSprite".animation = "GunBindSix"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputSeven"
				$"../GunTestSprite".animation = "GunBindSeven"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputEight"
				$"../GunTestSprite".animation = "GunBindEight"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputNine"
				$"../GunTestSprite".animation = "GunBindNine"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputOne"
				$"../GunTestSprite".animation = "GunBindOne"
		if event.is_action_pressed("RightClick"):
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputNine"
				$"../GunTestSprite".animation = "GunBindNine"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputOne"
				$"../GunTestSprite".animation = "GunBindOne"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputTwo"
				$"../GunTestSprite".animation = "GunBindTwo"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputThree"
				$"../GunTestSprite".animation = "GunBindThree"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputFive"
				$"../GunTestSprite".animation = "GunBindFour"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputSix"
				$"../GunTestSprite".animation = "GunBindFive"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputSix"
				$"../GunTestSprite".animation = "GunBindSix"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputSeven"
				$"../GunTestSprite".animation = "GunBindSeven"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputEight"
				$"../GunTestSprite".animation = "GunBindEight"

	else:
		$"../GunTestSprite".animation = "Blank"
		
func _process(delta):
	if $"..".playerOwner != GlobalVars.currentPlayer:
		$"../GunTestSprite".animation = "Blank"
