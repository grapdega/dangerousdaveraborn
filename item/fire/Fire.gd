extends Area2D


onready var player_vars = get_node("/root/Globals")

func _process(delta):
	$FireSprite.play("fire")


func _on_Fire_body_entered(body):
	if body.is_in_group("player"):
		player_vars.isHit = true
