extends Area2D
func _ready():
	pass
func _input_event(_veiwport, event, _shape_idx):
	if event.is_action_pressed("LeftClick"):
		if GlobalVars.erasingBlock:
			$"..".blockHealth = -10
		else:
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputTwo"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindTwo"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputThree"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindThree"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputFour"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindFour"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputFive"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindFive"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputSix"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindSix"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputSeven"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindSeven"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputEight"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindEight"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputNine"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindNine"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputOne"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindOne"
		if event.is_action_pressed("RightClick"):
			if($"..".InputBind == "InputOne"):
				$"..".InputBind = "InputNine"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindNine"
			elif($"..".InputBind == "InputTwo"):
				$"..".InputBind = "InputOne"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindOne"
			elif($"..".InputBind == "InputThree"):
				$"..".InputBind = "InputTwo"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindTwo"
			elif($"..".InputBind == "InputFour"):
				$"..".InputBind = "InputThree"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindThree"
			elif($"..".InputBind == "InputFive"):
				$"..".InputBind = "InputFour"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindFour"
			elif($"..".InputBind == "InputSix"):
				$"..".InputBind = "InputFive"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindFive"
			elif($"..".InputBind == "InputSeven"):
				$"..".InputBind = "InputSix"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindSix"
			elif($"..".InputBind == "InputEight"):
				$"..".InputBind = "InputSeven"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindSeven"
			elif($"..".InputBind == "InputNine"):
				$"..".InputBind = "InputEight"
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindEight"
func _process(delta):
	if $"..".playerOwner == GlobalVars.currentPlayer:
		if($"..".InputBind == "InputOne"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindOne"
		elif($"..".InputBind == "InputTwo"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindTwo"
		elif($"..".InputBind == "InputThree"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindThree"
		elif($"..".InputBind == "InputFour"):
				$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindFour"
		elif($"..".InputBind == "InputFive"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindFive"
		elif($"..".InputBind == "InputSix"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindSix"
		elif($"..".InputBind == "InputSeven"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindSeven"
		elif($"..".InputBind == "InputEight"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindEight"
		elif($"..".InputBind == "InputNine"):
			$"../HomingRocketLauncherSprite".animation = "HomingRocketLauncherBindNine"
	else:
		$"../HomingRocketLauncherSprite".animation = "Blank"
