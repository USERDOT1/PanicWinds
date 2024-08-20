extends CharacterBody2D
@export var Speed : float
var explosion = load("res://Scenes/explosion.tscn")
var direction : float
var spawnPosition : Vector2
var spawnRotation : float
var shipVelocity : Vector2
var zIndex : int
var collided = false
var playerOwner
var playerPower
var target
var highestHeat = 0
var heatScore = 3
var penetration
var timer = 0

func _ready():
	
	var players = get_node("/root/MultiplayerGame/Players")
	
	global_position = spawnPosition
	global_rotation = direction
	z_index = 100#zIndex
func _physics_process(delta):
	if timer > 100:
		queue_free()
	else:
		timer += delta
	if Speed < 20000:
		Speed += 10
	var actualRotation = rotation - deg_to_rad(90)
	var move_vec = Vector2(Speed, 0).rotated(actualRotation)
	global_position += move_vec * delta
	if target != null:
		self.look_at(target.global_position)
		self.global_rotation += deg_to_rad(90)

func _on_area_2d_body_entered(body):
	print("hit")
	if collided:
		queue_free()
		if body.blockHealth != null:
			var instance = explosion.instantiate()
			instance.spawnPosition = global_position
			GlobalVars.get_node("/root/MultiplayerGame").add_child(instance)
	else:
		collided = true
func _on_detection_area_entered(area):
	if area.name == "HomingRocketLauncherInteractArea" || area.name == "heatSeekingMissileCollision" || area.name == "GunTestInteractArea" || area.name == "EngineInteractArea":
		print(area.name)
		if highestHeat != 0:
			if area.get_parent().heatScore > highestHeat:
				highestHeat = area.get_parent().heatScore
				target = area.get_parent()


func _on_detection_area_exited(area):
	if area.get_parent() == target:
		target = null
		highestHeat = 0
