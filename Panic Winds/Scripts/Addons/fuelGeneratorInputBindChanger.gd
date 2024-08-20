extends Area2D
var done = false

func _input_event(_veiwport, event, _shape_idx):#change bind if clicked on
	if $"..".playerOwner == GlobalVars.currentPlayer:
		if event.is_action_pressed("LeftClick"):
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputTwo"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindTwo"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputThree"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindThree"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputFour"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindFour"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputFive"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindFive"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputSix"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindSix"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputSeven"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindSeven"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputEight"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindEight"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputNine"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindNine"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputOne"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindOne"
		if event.is_action_pressed("RightClick"):
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputNine"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindNine"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputOne"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindOne"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputTwo"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindTwo"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputThree"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindThree"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputFour"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindFour"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputFive"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindFive"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputSix"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindSix"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputSeven"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindSeven"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputEight"
				$"../FuelGeneratorSprite".animation = "FuelGeneratorBindEight"
	else:
		$"../FuelGeneratorSprite".animation = "Blank"
func _process(delta):
	if $"..".playerOwner != GlobalVars.currentPlayer:
		$"../FuelGeneratorSprite".animation = "Blank"
