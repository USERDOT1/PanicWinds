class_name NameSelect
extends Control
@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton as Button

func _ready():
	$MarginContainer/HBoxContainer/VBoxContainer/PlayButton.pressed.connect(playPressed)
func playPressed():
	if GlobalVars.playerName.length() > 2:
		get_tree().paused = false
		$Select.play()
		await $Select.finished
		get_tree().change_scene_to_file("res://Scenes/Menus/PlaySelect.tscn")
		print("Go to play")
	else:
		$NotLongEnough.play()


func _on_play_button_mouse_entered():
	$MouseOver.play()
