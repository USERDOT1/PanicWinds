class_name PlayMenu
extends Control
@onready var back_button = $HBoxContainer/VBoxContainer/Back as Button
@onready var host_game_button = $HBoxContainer/VBoxContainer/HostMatch as Button
@onready var join_game_button = $HBoxContainer/VBoxContainer/JoinMatch as Button
func _ready():
	back_button.pressed.connect(backPressed)
	host_game_button.pressed.connect(hostGame)
	join_game_button.pressed.connect(joinGame)
	print("Go to sandbox")
func backPressed() -> void:
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn") 
	print("Go back to main")
func hostGame() -> void:
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/host_menu.tscn")
	print("Hosting game")
func joinGame() -> void:
	get_tree().paused = false
	$Select.play()
	await $Select.finished
	get_tree().change_scene_to_file("res://Scenes/Menus/join_menu.tscn")
	print("Joining game")


func _on_host_match_mouse_entered():
	$MouseOver.play()

func _on_join_match_mouse_entered():
	$MouseOver.play()

func _on_back_mouse_entered():
	$MouseOver.play()
