extends CharacterBody2D

class_name Enemy

var speed: float = 200.0
var target: CharacterBody2D

func _ready():
	target = get_parent().get_parent().get_node("Player")

func _physics_process(_delta):
	velocity = position.direction_to(target.position) * speed
	look_at(target.position)
	move_and_slide()
