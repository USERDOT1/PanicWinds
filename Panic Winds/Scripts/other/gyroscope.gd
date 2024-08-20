extends StaticBody2D
var spawnPosition : Vector2
var spawnRotation : float
var blockHealth = 40
var blockArmor = 0
var weight = 2
var playerOwner
var spawnName : String
var listCoords: Vector2
var blockWeight = 0.7
var heatScore = 0
var amount

func _ready():
	playerOwner = $"..".name
	name = spawnName
	global_position = spawnPosition
	global_rotation = deg_to_rad(spawnRotation)
	if GlobalVars.currentPlayer == get_parent():
		amount =  GlobalVars.slider.min_value / 4
		GlobalVars.turnSpeed += 0.01
func _process(delta):
	if GlobalVars.currentPlayer.cloaked:
		if $TierOneBlockSprite.modulate.a < 0:
			$TierOneBlockSprite.modulate.a = 0
		if $TierOneBlockSprite.modulate.a > 0.04:
			$TierOneBlockSprite.modulate.a = 0.04
		$TierOneBlockSprite.modulate.a += randf_range(-0.001,0.001)
	else:
		$TierOneBlockSprite.modulate.a = 1
	blockArmor = 0 + GlobalVars.shipArmor
	if blockHealth <= 0:
		GlobalVars.slider.min_value += amount
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
