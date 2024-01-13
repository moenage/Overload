extends CharacterBody2D

var playerSpeed: int = 500

var canLaser: bool = true

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
		var laserDir = (mousePos - position).normalized()
		shotLaser.emit(selectedMarker.global_position, laserDir)
	
		canLaser = false
		$LaserTimer.start()
		

func _on_laser_timer_timeout():
	canLaser = true
