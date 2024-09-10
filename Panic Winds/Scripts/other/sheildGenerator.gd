extends Area2D

func _input_event(_veiwport, event, _shape_idx):#change bind if clicked on
	if event.is_action_pressed("LeftClick"):
		if GlobalVars.erasingBlock:
			$"..".blockHealth = -10
