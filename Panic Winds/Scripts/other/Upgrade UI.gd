extends Control

func _process(delta):
	for i in range(len(GlobalVars.upgradeNames)):
		$Names.get_child(i).text = GlobalVars.upgradeNames.i
	for j in range(len(GlobalVars.upgradeCosts)):
		$Costs.get_child(j).text = GlobalVars.upgradeCosts.i
