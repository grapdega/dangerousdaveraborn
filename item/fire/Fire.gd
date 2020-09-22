extends Area2D


onready var player_vars = get_node("/root/Globals")

func _process(delta):
	$FireSprite.play("fire")

