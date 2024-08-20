extends ColorRect

func _process(delta):
	$Player.position = GlobalVars.currentPlayer.global_position/120 + Vector2(550,550)
