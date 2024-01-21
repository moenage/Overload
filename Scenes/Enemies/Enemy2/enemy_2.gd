extends CharacterBody2D

class_name Enemy2

@export var health = 80
var max_health = health
@export var speed: float = 180.0

var pulseSpeed = 1000

var target: CharacterBody2D
var levelNode: Node2D

var pulseScene: PackedScene = preload("res://Scenes/Projectiles/EnemyEnergyBall/energy_ball.tscn")

func _ready():
	levelNode = get_parent().get_parent()
	target = levelNode.get_node("Player")
	$ShootPulse.autostart = true

func _physics_process(_delta):
	velocity = position.direction_to(target.position) * speed
	look_at(target.position)
	move_and_slide()

func _on_shoot_pulse_timeout():
	var pulseDir = (target.global_position - global_position).normalized()
	
	var pulse = pulseScene.instantiate() as RigidBody2D
	pulse.position = $PulsePoint.global_position
	pulse.rotation_degrees = rad_to_deg(pulseDir.angle())
	pulse.linear_velocity = pulseDir * pulseSpeed
	levelNode.get_node("Projectiles").add_child(pulse)

func enemyHit(damage):
	health -= damage
	if(health <= 0):
		queue_free()



