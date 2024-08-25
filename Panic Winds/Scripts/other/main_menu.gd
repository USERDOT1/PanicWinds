class_name MainMenu
extends Control
@onready var play_button = $MarginContainer/HBoxContainer/VBoxContainer/PlayButton as Button
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/QuitButton as Button

func _ready():
	get_tree().root.content_scale_aspect = Window.CONTENT_SCALE_ASPECT_IGNORE
	get_window().content_scale_aspect = Window.CONTENT_SCALE_ASPECT_IGNORE
	if "--server" in OS.get_cmdline_args():
		hostGame()
	$MarginContainer/HBoxContainer/VBoxContainer/PlayButton.pressed.connect(playPressed)
	$MarginContainer/HBoxContainer/VBoxContainer/QuitButton.pressed.connect(quitPressed)
	$MarginContainer/HBoxContainer/VBoxContainer/SettingsButton.pressed.connect(settingsPressed)

func hostGame():
	GlobalVars.peer = ENetMultiplayerPeer.new()
	var error = GlobalVars.peer.create_server(GlobalVars.port,8)
	if error != OK:
		print("Cannot host; " + str(error))
		return
	GlobalVars.peer.get_host().comp(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(GlobalVars.peer)
	print("Waiting For players ;)")


func playPressed():
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/NameSelect.tscn")
	print("Go to play")


func settingsPressed():
	$Select.play()
	await $Select.finished
	$MainSettingsMenu.shhom()


func quitPressed():
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	print("Quit")
	get_tree().quit()


func _on_play_button_mouse_entered():
	$MouseOver.play()


func _on_quit_button_mouse_entered():
	$MouseOver.play()


func _on_settings_button_mouse_entered():
	$MouseOver.play()

