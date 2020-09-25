extends Area2D

var speed = 300
var velocity = Vector2()
onready var globals = get_node("/root/Globals")

func _process(delta):
	velocity.x = -speed * delta
	translate(velocity)

func _on_MonsterBullet_body_entered(_body):
	queue_free()
