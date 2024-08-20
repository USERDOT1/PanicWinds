extends Area2D

func _input_event(veiwport, event, shape_idx):
	if event.is_action_pressed("LeftClick"):
		GlobalVars.Energy += 1
