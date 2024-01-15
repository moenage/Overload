extends RigidBody2D

@export var velocity = Vector2(200,200)
@export var health = 100

func _physics_process(delta):
	var collided = move_and_collide(velocity * delta)
	if collided:
		velocity = velocity.bounce(collided.get_normal())

func ballHit(damage):
	health -= damage
	if(health <= 0):
		print("game over") # load into game over scene
		queue_free()
