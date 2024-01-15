extends Area2D

@export var speed: int = 1000

var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if "enemyHit" in body:
		body.enemyHit(10)
		print("Enemy has ", body.health, " health")
	elif "ballHit" in body:
		body.ballHit(10)
	queue_free()
