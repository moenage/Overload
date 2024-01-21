extends RigidBody2D

signal endGame

func _on_body_entered(_body):
	var bodiesHit = $Area2D.get_overlapping_bodies()
	for i in bodiesHit:
		if "playerHit" in i:
			i.playerHit(20)
	queue_free()
	

