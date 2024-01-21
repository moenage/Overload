extends Node2D

# Vars used for overload
@export var rotateSpeed = 20
@export var overloadWait = 0.2
@export var overloadSpawnCount = 4
var radius = 100

@onready var overloadTimer = $OverloadTimer
@onready var slowMoTimer = $SloMoTimer
@onready var overloader = $"."
@onready var spawnPoints = $SpawnPoints

signal overloadLaser(pos, laserDir)

func _ready():
	var step = 2 * PI / overloadSpawnCount
	set_process(false)
	
	for i in range(overloadSpawnCount):
		var spawnPoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		spawnPoints.add_child(spawnPoint)
	
	overloadTimer.wait_time = overloadWait

func startOverload():
	overloadTimer.start()
	Engine.time_scale = 0.1
	slowMoTimer.start()
	set_process(true)
	
func stopOverload():
	overloadTimer.stop()
	set_process(false)
	
func _process(delta):
	var newRotation = spawnPoints.rotation_degrees + rotateSpeed * delta
	spawnPoints.rotation_degrees = fmod(newRotation, 360)

func _on_overload_timer_timeout():
	for i in spawnPoints.get_children():
		overloadLaser.emit(i.global_position, i.global_rotation)

func _on_slo_mo_timer_timeout():
	Engine.time_scale = 1
