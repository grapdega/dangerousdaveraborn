extends Area2D

var speed = 300
var velocity = Vector2()
var initpos = 0
var direction = -1
onready var globals = get_node("/root/Globals")

func _process(delta):
	if initpos == 0:
		initpos = global_position.x
	velocity.x = speed * delta * direction
	translate(velocity)
	if (global_position.x -initpos)*direction > 640:
		queue_free()

func _on_MonsterBullet_body_entered(_body):
	queue_free()

