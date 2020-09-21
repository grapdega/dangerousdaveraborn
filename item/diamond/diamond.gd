extends Area2D



func _ready():
	pass # Replace with function body.







func _body_entered(body):
	if body:
		queue_free()
