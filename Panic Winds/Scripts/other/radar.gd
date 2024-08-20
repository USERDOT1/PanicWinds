extends Area2D
func _ready():
	GlobalVars.currentRadarCollider = self
func  _process(delta):
	GlobalVars.currentRadarCollider = self
	$".".global_position = GlobalVars.currentPlayer.global_position
	GlobalVars.radarRotation += (deg_to_rad(720/17) * delta)
	self.rotation = GlobalVars.radarRotation

func _on_area_entered(area):
	if area.name == "ShipArea" && GlobalVars.radarEnabled && GlobalVars.hasRadar:
		$AudioStreamPlayer2D.play()
		GlobalVars.radarDisplay.plotPoint(area.global_position)
