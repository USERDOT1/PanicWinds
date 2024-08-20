extends StaticBody2D
var spawnPosition : Vector2
var spawnRotation : float
var blockHealth = 150
var blockArmor = 10
var weight = 2
var playerOwner
var spawnName : String
var listCoords: Vector2
var blockWeight = 1
var heatScore = 0

func _ready():
	playerOwner = $"..".name
	name = spawnName
	global_position = spawnPosition
	global_rotation = deg_to_rad(spawnRotation)
func _process(delta):
	if get_parent().cloaked:
		if $TierOneBlockSprite.modulate.a < 0:
			$TierOneBlockSprite.modulate.a = 0
		if $TierOneBlockSprite.modulate.a > 0.04:
			$TierOneBlockSprite.modulate.a = 0.04
		$TierOneBlockSprite.modulate.a += randf_range(-0.001,0.001)
	else:
		$TierOneBlockSprite.modulate.a = 1
	blockArmor = 10 + GlobalVars.shipArmor
	if blockHealth <= 0:
		GameManager.destroyObject.rpc(playerOwner, name, playerOwner.name, listCoords, false, weight)
