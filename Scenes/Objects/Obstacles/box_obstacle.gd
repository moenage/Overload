extends StaticBody2D

var health = 70
var rotateSpeed = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotateSpeed * delta

func objHit(damage):
	health -= damage
	if(health <= 0):
		queue_free()
