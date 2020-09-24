extends KinematicBody2D


func _ready():
	self.add_to_group("monster")

func _process(delta):
	pass
func dead():
	queue_free()
