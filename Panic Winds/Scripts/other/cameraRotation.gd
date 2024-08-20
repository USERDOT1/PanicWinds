extends Node
func _process(delta):
	if Input.is_action_pressed("QPressed") && not GlobalVars.paused:
			self.rotation += delta
	if Input.is_action_pressed("EPressed") && not GlobalVars.paused:
			self.rotation -= delta
	if Input.is_action_just_pressed("QPressed") && GlobalVars.paused:
		GlobalVars.placementRotation -= deg_to_rad(90)
	if Input.is_action_just_pressed("EPressed") && GlobalVars.paused:
		GlobalVars.placementRotation += deg_to_rad(90)
	var shipPosition = Vector2($"../Ship".global_position.x,$"../Ship".global_position.y)
	self.position = shipPosition
