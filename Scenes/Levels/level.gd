extends Node2D

# Vars used for enemy spawning
@export var minxCoord: int = -640
@export var minyCoord: int = -135
@export var maxxCoord: int = 2563
@export var maxyCoord: int = 1400

var reduceTimer = 0.1

@onready var projectiles = $Projectiles
@onready var obstacles = $Obstacles
@onready var enemies = $Enemies
@onready var enemyTimer = $SpawnTimer
@onready var obsTimer = $ObstacleTimer
@onready var player = $Player
@onready var gameOverScreen = $UI/GameOver
@onready var ricktextLabel = $UI/RichTextLabel

#Getting scenes
var laserScene: PackedScene = preload("res://Scenes/Projectiles/laser.tscn")
var enemyScene: PackedScene = preload("res://Scenes/Enemies/Enemy1/enemy_1.tscn")
var enemy2Scene: PackedScene = preload("res://Scenes/Enemies/Enemy2/enemy_2.tscn")
var boxScene: PackedScene = preload("res://Scenes/Objects/Obstacles/box_obstacle.tscn")
var satelliteScene: PackedScene = preload("res://Scenes/Objects/Obstacles/satellite.tscn")

var enemyArray = [enemyScene, enemy2Scene]
var obstacleArray = [boxScene, satelliteScene]
var obstacleSpawns = []


func _ready():
	obstacleSpawns = [$ObSpawn1, $ObSpawn2, $ObSpawn3, $ObSpawn4]
	_on_obstacle_timer_timeout()

# Spawn Bullet from player
func _on_player_shot_laser(pos, laserDir):
	var laser = laserScene.instantiate() as Area2D
	laser.position = pos
	laser.rotation = laserDir
	projectiles.add_child(laser)

# Spawn enemies within the arena borders
func _on_spawn_timer_timeout():
	var enemy = enemyArray[randi() % enemyArray.size()].instantiate() as CharacterBody2D
	enemy.position = Vector2(randf_range(minxCoord,maxxCoord), randf_range(minyCoord,maxyCoord))
	
	enemies.add_child(enemy)
	enemyTimer.wait_time -= reduceTimer
	if enemyTimer.wait_time < 2.5:
		reduceTimer = 0
		
	
func _on_obstacle_timer_timeout():
	for i in range(4):
		var obs = obstacleArray[randi() % obstacleArray.size()].instantiate() as StaticBody2D
		obs.position = obstacleSpawns[i].position
		
		obstacles.add_child(obs)


func _on_obstacles_child_exiting_tree(_node):
	var childCount = obstacles.get_child_count()
	if(childCount <= 1):
		print("lol")
		obsTimer.start()

func _on_enemies_child_exiting_tree(_node):
	if player.overload >= 1:
		player.overload -= 1
	else:
		player.overload = 0


func _on_protect_me_end_game():
	gameOverScreen.setScore(ricktextLabel.text)
	gameOverScreen.visible = true
