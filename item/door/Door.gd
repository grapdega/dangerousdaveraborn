extends Area2D

onready var player_vars = get_node("/root/Globals")

func _on_Door_body_entered(body):
	if body.is_in_group("player") and player_vars.player_has_class:
		get_tree().change_scene("res://level/Level2.tscn")
		player_vars.player_has_class = false
