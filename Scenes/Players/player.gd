extends CharacterBody2D

@export var playerSpeed: int = 800
var canLaser: bool = true
var overload = 0

@onready var overloadLength = $OverloadLength
@onready var overloader = $Overloader

signal shotLaser(pos, laserDir)

func _process(_delta):
	
	var mousePos = get_global_mouse_position() as Vector2
	
	#ROTATE
	look_at(mousePos)
	
	#input
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * playerSpeed
	move_and_slide()
	
	if Input.is_action_pressed("primaryAction") and canLaser:
		var selectedMarker = $LaserPoint
		var laserDir = global_rotation
		shotLaser.emit(selectedMarker.global_position, laserDir)
		canLaser = false
		$LaserTimer.start()

func _on_laser_timer_timeout():
	canLaser = true
	
func playerHit(damage):
	overload += damage
	if overload >= 100:
		overloader.startOverload()
		overloadLength.start()
		overload = 0
		

func _on_overloader_overload_laser(pos, laserDir):
	shotLaser.emit(pos, laserDir)

func _on_overload_length_timeout():
	overloader.stopOverload()
