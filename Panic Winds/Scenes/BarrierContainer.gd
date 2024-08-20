extends Node2D
var blockHealth = 250
var blockArmor = 0

func _ready():
	if $".." == GlobalVars.currentPlayer:
		GlobalVars.currentBarrier = self
	GameManager.barrierDespawn.rpc($"..".name)
	if blockHealth <= 0:
		$".".visible = false
		z_index = -2


func _process(delta):
	pass
