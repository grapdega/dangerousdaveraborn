extends Area2D

var speed = 300
var velocity = Vector2()
var initpos=0
var direction=1

func _ready():
	add_to_group("bullet")
	direction=Globals.playerDirection
	if direction == -1:
		rotate(PI)

func _process(delta):
	if initpos == 0:
		initpos = global_position.x
	velocity.x = speed * delta * direction
	translate(velocity)
	if (global_position.x -initpos)*direction > 640:
		queue_free()


func _on_Bullet_body_entered(body):
	if body.name == "Monster":
		body.dead()
	queue_free()
