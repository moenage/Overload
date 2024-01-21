extends ProgressBar

@onready var ballHealth = $"../../ProtectMe"

func _ready():
	max_value = ballHealth.health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	value = ballHealth.health
