extends Path2D

onready var folow = $PathFollow2D
export var speed=100

func _process(delta):
	folow.set_offset(folow.get_offset()+speed*delta)
	
