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
		Speed += 80
	global_position.x += shipVelocity.x * delta
	global_position.y -= shipVelocity.y * delta
	velocity = Vector2(0,-Speed).rotated(global_rotation)
	if Speed < 10000 && Speed > 5000:
		var v = playerOwner.globalMousePositionC - global_position
		var angle = v.angle()
		var r = global_rotation - deg_to_rad(90)
		global_rotation = lerp_angle(r,angle,0.04)+deg_to_rad(90)
	move_and_slide()


func _on_area_2d_body_entered(body):
	print("hit")
	if collided:
		queue_free()
		if body.blockHealth != null:
			var instance = explosion.instantiate()
			instance.spawnPosition = global_position
			GlobalVars.get_node("/root/MultiplayerGame").add_child(instance)
	if !collided:
		collided = true
