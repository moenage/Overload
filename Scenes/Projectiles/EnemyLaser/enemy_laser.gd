extends Area2D

@export var speed: int = 1000

var direction: Vector2 = Vector2.UP

func _process(delta):
	position += direction * speed * delta
	

func _on_body_entered(body):
	if "playerHit" in body:
		body.playerHit(10)
		print(body.overload)
	queue_free()
	

