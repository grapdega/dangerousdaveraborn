extends KinematicBody2D

const BULLET = preload("res://object/MonsterBullet.tscn")
var timer
func _ready():
	timer = get_tree().create_timer(0.0)
	self.add_to_group("monster")

func _process(_delta):
	if timer.time_left <= 0.0:
		timer = get_tree().create_timer(5.0)
		yield(timer, "timeout")
		var bullet = BULLET.instance()
		get_parent().add_child(bullet)
		bullet.position = $Position2D.global_position
	
func dead():
	queue_free()



