extends Node2D

var laserScene: PackedScene = preload("res://Scenes/Projectiles/laser.tscn")

func _on_player_shot_laser(pos, laserDir):
	var laser = laserScene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(laserDir.angle()) + 90
	laser.direction = laserDir
	$Projectiles.add_child(laser)
