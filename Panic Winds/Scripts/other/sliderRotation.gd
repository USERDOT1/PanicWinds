extends HSlider
func _process(_delta):
	GlobalVars.placementRotation = (self.value*90)#45
