extends Area2D

onready var globals = get_node("/root/Globals")

func _on_Door_body_entered(body):
	if body.is_in_group("player") and globals.player_has_class:
		get_tree().change_scene("res://level/Level"+str(globals.level+1)+".tscn")
		globals.level += 1
		globals.player_has_class = false
		globals.hasJetpack = false
		globals.jetpackIsActive = false
		
