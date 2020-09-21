extends Area2D

onready var player_vars = get_node("/root/Globals")

func _on_diamond_body_entered(body):
	if body.is_in_group("player"):
		player_vars.player_score += 100
		queue_free()
