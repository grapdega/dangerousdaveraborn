extends Path2D

onready var folow = $PathFollow2D

func _process(delta):
	folow.set_offset(folow.get_offset()+100*delta)
	
