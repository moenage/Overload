extends RigidBody2D

@export var velocity = Vector2(200,200)

func _physics_process(delta):
	var collided = move_and_collide(velocity * delta)
	if collided:
		velocity = velocity.bounce(collided.get_normal())
