extends CharacterBody2D

@export var speed = 100
@export var health = 100

var rng = RandomNumberGenerator.new()

var direction = Vector2()

func _ready():
	velocity = Vector2(1000,1000)
	randomize()
	# start with random direction beetween -1 and 1
	direction.x = rng.randf_range(-1, 1)
	direction.y = rng.randf_range(-1, 1)
	


func _physics_process(delta):
	var collided = move_and_collide(velocity * delta)
	if collided:
		velocity = velocity.bounce(collided.get_normal())


func ballHit(damage):
	health -= damage
	if(health <= 0):
		print("game over") # load into game over scene
		queue_free()
