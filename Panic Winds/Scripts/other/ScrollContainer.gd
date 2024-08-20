extends ScrollContainer

func _ready():
	connect("minimum_size_changed", Callable(self, "_on_minimum_size_changed"))
	connect("resized", Callable(self, "_resized"))

func _on_minimum_size_changed():
	print("minimum_size_changed: " + str(get_minimum_size()))

func _resized():
	print("resized: " + str(size))
