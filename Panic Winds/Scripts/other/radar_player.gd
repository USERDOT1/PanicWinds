extends Node2D


func _ready():
	z_index = 101
	self.position = GlobalVars.playerDetectionPoint

func _process(delta):
	self.position = GlobalVars.playerDetectionPoint
