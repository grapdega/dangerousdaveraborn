extends Node2D

onready var player_vars = get_node("/root/Globals")

func _process(delta):
	$ScoreCount.text = str(player_vars.player_score)
	
