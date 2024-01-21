extends Control

func setScore(value):
	$Panel/Score.text = "Score: " + str(value)


func _on_restart_pressed():
	Engine.time_scale = 1
	get_tree().reload_current_scene()


func _on_button_pressed():
	get_tree().quit()
