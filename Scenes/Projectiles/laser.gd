extends Area2D

@export var speed: int = 1000

#var direction: Vector2 = Vector2.UP

func _process(delta):
	position += transform.x * speed * delta
	

func _on_body_entered(body):
	if "enemyHit" in body:
		body.enemyHit(10)
	elif "ballHit" in body:
		body.ballHit(10)
	elif "objHit" in body:
		body.objHit(10)
	queue_free()
