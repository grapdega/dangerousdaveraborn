extends Area2D

onready var globals = get_node("/root/Globals")

func _on_Gun_body_entered(body):
	if body.is_in_group("player"):
		globals.hasGun = true
		queue_free()
		
# warning-ignore:unused_argument
func _process(delta):
	if globals.hasGun:
		queue_free()
