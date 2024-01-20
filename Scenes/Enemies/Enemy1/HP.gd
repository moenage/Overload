extends ProgressBar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	value = get_parent().get_parent().health * 100 / get_parent().get_parent().max_health
