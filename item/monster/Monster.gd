extends KinematicBody2D

const BULLET = preload("res://object/MonsterBullet.tscn")
var timer
var fire =	true
func _ready():
	timer = get_tree().create_timer(0.0)
	self.add_to_group("monster")

func _process(_delta):
	if fire:
		if timer.time_left <= 0.0:
			timer = get_tree().create_timer(0.6)
			yield(timer, "timeout")
			var bullet = BULLET.instance()
			get_parent().get_parent().add_child(bullet)
			bullet.global_position = $Position2D.global_position
			
func dead():
	queue_free()

func _on_PlayerDetect_body_entered(body):
	if body.is_in_group("player"):
		fire = true

func _on_PlayerDetect_body_exited(body):
	if body.is_in_group("player"):
		fire = false
