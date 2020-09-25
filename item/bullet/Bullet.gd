extends Area2D

var speed = 300
var velocity = Vector2()

func _process(delta):
	velocity.x = speed * delta
	translate(velocity)


func _on_Bullet_body_entered(body):
	if body.is_in_group("monster"):
		body.dead()
	queue_free()
