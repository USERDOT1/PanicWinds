extends AnimatedSprite2D
@onready var radarPlayer = load("res://Scenes/radar_player.tscn")

func _ready():
	GlobalVars.radarDisplay = self
	
func  _process(delta):
	if $".".frame == 0:
		GlobalVars.radarRotation = deg_to_rad(90)
	if $".".frame == 41:
		GlobalVars.radarRotation = deg_to_rad(180)
	if $".".frame == 84:
		GlobalVars.radarRotation = deg_to_rad(270)
	if $".".frame == 127:
		GlobalVars.radarRotation = deg_to_rad(270)
	

func plotPoint(playerPosition):
	var instance = radarPlayer.instantiate()
	self.add_child(instance)
	print(playerPosition-GlobalVars.currentPlayer.global_position)
	var pos = ((playerPosition-GlobalVars.currentPlayer.global_position)/1600)
	GlobalVars.playerDetectionPoint = pos
