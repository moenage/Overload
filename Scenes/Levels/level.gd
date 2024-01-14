extends Node2D

@export var minxCoord: int = -640
@export var minyCoord: int = -135
@export var maxxCoord: int = 2563
@export var maxyCoord: int = 1400

var laserScene: PackedScene = preload("res://Scenes/Projectiles/laser.tscn")

var enemyScene: PackedScene = preload("res://Scenes/Enemies/Enemy1/enemy_1.tscn")

#Spawn Bullet from player
func _on_player_shot_laser(pos, laserDir):
	var laser = laserScene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(laserDir.angle()) + 90
	laser.direction = laserDir
	$Projectiles.add_child(laser)

#Spawn enemies within the arena borders
func _on_spawn_timer_timeout():
	var enemy = enemyScene.instantiate() as Node2D
	enemy.position = Vector2(randf_range(minxCoord,maxxCoord), 
	randf_range(minyCoord,maxyCoord))
	$Enemies.add_child(enemy)
	$SpawnTimer.wait_time -= 0.1

