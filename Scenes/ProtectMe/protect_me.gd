extends PhysicsBody2D

#@export var speed = Vector2(1300,1300)
@export var health = 300

var rng = RandomNumberGenerator.new()

var direction = Vector2()
var velocity = Vector2(1000, 1000)

signal endGame

func _ready():
	#velocity = Vector2(1000,1000)
	randomize()
	# start with random direction beetween -1 and 1
	direction.x = rng.randf_range(-1, 1)
	direction.y = rng.randf_range(-1, 1)
	


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())

func ballHit(damage):
	health -= damage
	if(health <= 0):
		endGame.emit()
		print("game over") # load into game over scene
		Engine.time_scale = 0
		
