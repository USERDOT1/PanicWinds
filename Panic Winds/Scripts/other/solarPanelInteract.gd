extends Area2D
var done = false

func _process(_delta): #add flames
	if $"..".playerOwner == GlobalVars.currentPlayer:
		done = false
		if $"..".InputBind == "InputOne" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindOneActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindOne"
		if $"..".InputBind == "InputTwo" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindTwoActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindTwo"
		if $"..".InputBind == "InputThree" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindThreeActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindThree"
		if $"..".InputBind == "InputFour" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindFourActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindFour"
		if $"..".InputBind == "InputFive" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindFiveActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindFive"
		if $"..".InputBind == "InputSix" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindSixActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindSix"
		if $"..".InputBind == "InputSeven" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindSevenActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindSeven"
		if $"..".InputBind == "InputEight" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindEightActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindEight"
		if $"..".InputBind == "InputNine" && !done:
			if $"..".solarPanelOn:
				if GlobalVars.Energy > 0:
					$"../EngineSprite".animation = "EngineBindNineActive"
				done = true
			else:
				$"../EngineSprite".animation = "EngineBindNine"
		if !(GlobalVars.Energy > 0):
			if $"../EngineSprite".animation == "EngineBindOneActive":
				$"../EngineSprite".animation = "EngineBindOne"
			if $"../EngineSprite".animation == "EngineBindTwoActive":
				$"../EngineSprite".animation = "EngineBindTwo"
			if $"../EngineSprite".animation == "EngineBindThreeActive":
				$"../EngineSprite".animation = "EngineBindThree"
			if $"../EngineSprite".animation == "EngineBindFourActive":
				$"../EngineSprite".animation = "EngineBindFour"
			if $"../EngineSprite".animation == "EngineBindFiveActive":
				$"../EngineSprite".animation = "EngineBindFive"
			if $"../EngineSprite".animation == "EngineBindSixActive":
				$"../EngineSprite".animation = "EngineBindSix"
			if $"../EngineSprite".animation == "EngineBindSevenActive":
				$"../EngineSprite".animation = "EngineBindSeven"
			if $"../EngineSprite".animation == "EngineBindEightActive":
				$"../EngineSprite".animation = "EngineBindEight"
			if $"../EngineSprite".animation == "EngineBindNineActive":
				$"../EngineSprite".animation = "EngineBindNine"
	else:
		$"../EngineSprite".animation = "Blank"
func _input_event(_veiwport, event, _shape_idx):#change bind if clicked on
	if event.is_action_pressed("LeftClick"):
		if GlobalVars.erasingBlock:
			$"..".blockHealth = -10
		else:
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputTwo"
				$"../EngineSprite".animation = "EngineBindTwo"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputThree"
				$"../EngineSprite".animation = "EngineBindThree"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputFour"
				$"../EngineSprite".animation = "EngineBindFour"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputFive"
				$"../EngineSprite".animation = "EngineBindFive"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputSix"
				$"../EngineSprite".animation = "EngineBindSix"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputSeven"
				$"../EngineSprite".animation = "EngineBindSeven"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputEight"
				$"../EngineSprite".animation = "EngineBindEight"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputNine"
				$"../EngineSprite".animation = "EngineBindNine"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputOne"
				$"../EngineSprite".animation = "EngineBindOne"
	if event.is_action_pressed("RightClick"):
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputNine"
				$"../EngineSprite".animation = "EngineBindNine"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputOne"
				$"../EngineSprite".animation = "EngineBindOne"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputTwo"
				$"../EngineSprite".animation = "EngineBindTwo"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputThree"
				$"../EngineSprite".animation = "EngineBindThree"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputFour"
				$"../EngineSprite".animation = "EngineBindFour"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputFive"
				$"../EngineSprite".animation = "EngineBindFive"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputSix"
				$"../EngineSprite".animation = "EngineBindSix"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputSeven"
				$"../EngineSprite".animation = "EngineBindSeven"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputEight"
				$"../EngineSprite".animation = "EngineBindEight"
