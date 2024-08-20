extends HSlider
func _process(_delta):
	if $".." == GlobalVars.currentBuildingUi:
		GlobalVars.placementType = self.value
		if(GlobalVars.placementType == 1):
			$"../LabelSprite".animation = "TierOneBlock"
		if(GlobalVars.placementType == 2):
			$"../LabelSprite".animation = "Engine"
		if(GlobalVars.placementType == 3):
			$"../LabelSprite".animation = "GunTest"
		if(GlobalVars.placementType == 4):
			$"../LabelSprite".animation = "FuelGenerator"
		if(GlobalVars.placementType == 5):
			$"../LabelSprite".animation = "RocketLauncher"
