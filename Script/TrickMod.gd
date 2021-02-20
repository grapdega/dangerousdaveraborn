extends Sprite

onready var globals = $"/root/Globals"

func _ready():
	if globals.gameMode == "Trick":
		$StaticBody2D.queue_free()
