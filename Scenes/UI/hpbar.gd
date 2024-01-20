extends ProgressBar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value = $Enemies.health
	if value == 0:
		queue_free()
