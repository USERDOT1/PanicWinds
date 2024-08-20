extends Button
@onready var teirOneBlock = load("res://Scenes/Ship/teir_one_block.tscn")
@onready var engine = load("res://Scenes/Ship/engine.tscn")
@onready var gun = load("res://Scenes/Ship/gun_test.tscn")
@onready var ship = get_tree().get_root().get_node("Sandbox").get_node("Ship")
func _ready():
	connect("button_down", clicked)
func _process(_delta):
	pass
func clicked():
	
	GlobalVars.enabled = true
