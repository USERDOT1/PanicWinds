class_name JoinMenu
extends Control
@onready var join_game_button = $"HBoxContainer/VBoxContainer/Join Game" as Button
@onready var back_button = $HBoxContainer/VBoxContainer/Back as Button
func _ready():
	multiplayer.peer_connected.connect(playerConnected)
	multiplayer.peer_disconnected.connect(playerDisconnected)
	multiplayer.connected_to_server.connect(connectedToServer)
	multiplayer.connection_failed.connect(connectionFailed)
	back_button.pressed.connect(back)
	join_game_button.pressed.connect(joinGame)
	GlobalVars.peer = ENetMultiplayerPeer.new()
	GlobalVars.peer.create_client(GlobalVars.adress,GlobalVars.port)
	GlobalVars.peer.get_host().compress(ENetConnection.COMPRESS_RANGE_CODER)
	multiplayer.set_multiplayer_peer(GlobalVars.peer)
func playerConnected(id) -> void:
	# Fires on server and clients
	print("Player conntected"+ str(id))
func playerDisconnected(id) -> void:
	# Fires on server and clients
	print("Player disconnected" + str(id))
func connectedToServer() -> void:
	# Fires only on client
	print("Connected to server")
	GameManager.sendPlayerInfo.rpc_id(1, GlobalVars.playerName, multiplayer.get_unique_id())
func connectionFailed() -> void:
	# Fires only on client
	print("Connection failed")
	
func joinGame():
	$Select.play()
	await $Select.finished
	GameManager.startGameInitiate.rpc()
	self.hide()


func back():
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/PlaySelect.tscn")
	
	


func _on_join_game_mouse_entered():
	$MouseOver.play()

func _on_back_mouse_entered():
	$MouseOver.play()
