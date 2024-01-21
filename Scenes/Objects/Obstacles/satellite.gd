extends StaticBody2D

var health = 100
var rotateSpeed = 0.3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation += rotateSpeed * delta

func objHit(damage):
	health -= damage
	if(health <= 0):
		queue_free()
