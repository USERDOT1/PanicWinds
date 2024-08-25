extends CharacterBody2D
@export var Speed : float
var direction : float
var spawnPosition : Vector2
var spawnRotation : float
var shipVelocity : Vector2
var zIndex : int
var collided = false
var active = false
var playerOwner
var damageCalculation
var playerPower
var hitTarget = false
var penetration
var timer = 0

func _ready():
	global_position = spawnPosition
	global_rotation = spawnRotation
	z_index = 100#zIndex
	$FireSound.play()

func _physics_process(delta):
	if timer > 100:
		queue_free()
	else:
		timer += delta
	global_position.x += shipVelocity.x * delta
	global_position.y -= shipVelocity.y * delta
	velocity = Vector2(0,-Speed).rotated(direction)
	move_and_slide()


func _on_area_2d_body_entered(body):
	print("lol")
	if hitTarget == false:
		if collided:
			if body.blockHealth != null:
				hitTarget = true
				$CollisionSound.play()
				if penetration != null:
					if body.blockArmor - penetration > 0:
						damageCalculation = playerPower - (body.blockArmor - penetration)
						if damageCalculation > 0:
							body.blockHealth -= damageCalculation
					else:
						damageCalculation = playerPower - body.blockArmor
						if damageCalculation > 0:
							body.blockHealth -= damageCalculation
				else:
					damageCalculation = playerPower - body.blockArmor
					if damageCalculation > 0:
						body.blockHealth -= damageCalculation
				visible = false
		if !collided:
			collided = true
