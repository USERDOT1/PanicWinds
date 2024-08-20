extends Node
var menuOpen = false
func _process(_delta):
	if Input.is_action_just_pressed("EscapePressed"):
		if menuOpen:
			self.visible = false
			GlobalVars.paused = false
			menuOpen = false
		else:
			self.visible = true
			GlobalVars.paused = true
			menuOpen = true
