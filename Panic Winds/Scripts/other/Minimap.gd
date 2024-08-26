extends ColorRect

func _process(delta):
	$Player.position = GlobalVars.currentPlayer.global_position/137 + Vector2(562.5,552.5)
