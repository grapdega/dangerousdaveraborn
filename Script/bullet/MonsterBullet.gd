extends Area2D

var speed = 300
var velocity = Vector2()
var initpos = 0
var direction = -1
onready var globals = get_node("/root/Globals")

func _process(delta):
	if initpos == 0:
		initpos = global_position.x
	if (global_position.x -initpos)*direction > 640:
		queue_free()
	velocity.x = -speed * delta
	translate(velocity)

func _on_MonsterBullet_body_entered(_body):
	queue_free()

