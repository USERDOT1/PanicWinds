extends Label

func _process(delta):
	if $"..".cloaked:
		self.hide()
	else:
		self.show()
