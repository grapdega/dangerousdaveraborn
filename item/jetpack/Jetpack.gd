extends Area2D

onready var globals = get_node("/root/Globals")

func _on_Jetpack_body_entered(body):
	if body.is_in_group("player"):
		globals.hasJetpack = true
		queue_free()