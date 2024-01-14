extends CharacterBody2D

class_name Enemy

@export var speed: float = 200.0
var target: CharacterBody2D
var levelNode: Node2D

var laserEnemyScene: PackedScene = preload("res://Scenes/Projectiles/EnemyLaser/enemy_laser.tscn")

func _ready():
	levelNode = get_parent().get_parent()
	target = levelNode.get_node("Player")
	$ShootLaser.autostart = true

func _physics_process(_delta):
	velocity = position.direction_to(target.position) * speed
	look_at(target.position)
	move_and_slide()


func _on_shoot_laser_timeout():
	var laserDir = (target.global_position - global_position).normalized()
	
	var laser = laserEnemyScene.instantiate() as Area2D
	laser.position = $LaserPoint.global_position
	laser.rotation_degrees = rad_to_deg(laserDir.angle()) + 90
	laser.direction = laserDir
	levelNode.get_node("Projectiles").add_child(laser)
