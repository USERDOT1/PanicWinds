extends Node2D
var timer = 0
var spawnPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.play()
	$Sprite2D.modulate.a = 0.8
	global_position = spawnPosition


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer < 0.5:
		timer += delta
		$Sprite2D.scale += 10*Vector2(delta,delta)
		$Area2D/CollisionShape2D.scale += 10*Vector2(delta,delta)
	else:
		$Area2D/CollisionShape2D.disabled
		if $Sprite2D.modulate.a > delta:
			$Sprite2D.modulate.a -= delta
		else:
			queue_free()


func _on_area_2d_body_entered(body):
	if body.blockHealth != null:
			body.blockHealth -= 35
