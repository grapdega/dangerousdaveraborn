extends Area2D

onready var player_Vars = get_node("/root/Globals")

func _on_Class_body_entered(body):
	if body.is_in_group("player"):
		player_Vars.player_score += 500
		player_Vars.player_has_class = true
		queue_free()
