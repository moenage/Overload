extends Node2D

var laserEnemyScene: PackedScene = preload("res://Scenes/Projectiles/EnemyLaser/enemy_laser.tscn")

func _on_enemy_1_enemy_shot_laser(pos, laserDir):
	var laser = laserEnemyScene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(laserDir.angle()) + 90
	laser.direction = laserDir
	$Projectiles.add_child(laser)
