class_name HostMenu
extends Control
@onready var start_game_button = $HBoxContainer/VBoxContainer/StartGame as Button
@onready var copy_code_button = $HBoxContainer/VBoxContainer/CopyCode as Button
@onready var abort_match_button = $HBoxContainer/VBoxContainer/AbortMatch as Button
#var current_clipboard = DisplayServer.clipboard_get()
# Set the contents of the clipboard
var startLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var numbers = "0123456789"
func gen_unique_start(length: int) -> String:
	var startResult = ""
	for i in range(length):
		startResult += startLetter[randi() % startLetter.length()]
	return startResult
func gen_unique_num(length: int) -> String:
	var numResult = ""
	for i in range(length):
		numResult += numbers[randi() % numbers.length()]
	return numResult
	
func _ready():
	GameManager.sendPlayerInfo(GlobalVars.playerName, multiplayer.get_unique_id())
	multiplayer.peer_connected.connect(playerConnected)
	multiplayer.peer_disconnected.connect(playerDisconnected)
	multiplayer.connected_to_server.connect(connectedToServer)
	multiplayer.connection_failed.connect(connectionFailed)
	GlobalVars.gameCode = gen_unique_start(3) + gen_unique_num(5)
	start_game_button.pressed.connect(startGame)
	copy_code_button.pressed.connect(copyCode)
	abort_match_button.pressed.connect(abortMatch)
	GlobalVars.peer = ENetMultiplayerPeer.new()
	var error = GlobalVars.peer.create_server(GlobalVars.port,8)
	if error != OK:
		print("Cannot host; " + str(error))
		return
	GlobalVars.peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(GlobalVars.peer)
	print("Waiting For players ;)")
func playerConnected(id) -> void:
	# Fires on server and clients
	print("Player conntected"+ str(id))
func playerDisconnected(id) -> void:
	# Fires on server and clients
	print("Player disconnected" + str(id))
func connectedToServer() -> void:
	# Fires only on client
	print("Connected to server")
func connectionFailed() -> void:
	# Fires only on client
	print("Connection failed")
func startGame() -> void:
	$Select.play()
	await $Select.finished
	GameManager.startGameInitiate.rpc()
	self.hide()
func copyCode() -> void:
	$Select.play()
	await $Select.finished
	DisplayServer.clipboard_set(GlobalVars.gameCode)
func abortMatch() -> void:
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/PlaySelect.tscn")
func _process(delta):
	$VBoxContainer/Label2.text = "Game Code: " + str(GlobalVars.gameCode)


func _on_start_game_mouse_entered():
	$MouseOver.play()


func _on_copy_code_mouse_entered():
	$MouseOver.play()


func _on_abort_match_mouse_entered():
	$MouseOver.play()
