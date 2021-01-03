extends KinematicBody2D

const BULLET = preload("res://Prefabs/MonsterBullet.tscn")
onready var globals = get_node("/root/Globals")
var timer
var fire = true
onready var animation = $AnimatedSprite
func _ready():
	timer = get_tree().create_timer(0.0)
	if animation:
	   animation.play("default")
	self.add_to_group("monster")

func _process(_delta):
	if fire:
		if timer.time_left <= 0.0:
			timer = get_tree().create_timer(0.1+rand_range(0,9))
			yield(timer, "timeout")
			var bullet = BULLET.instance()
			get_parent().get_parent().add_child(bullet)
			bullet.global_position = $Position2D.global_position
			
func dead():
	if animation:
		var i=0
		while i<20:
			animation.play("dead")
			yield(animation,"animation_finished")
			i=i+1
	queue_free()

func _on_PlayerDetect_body_entered(body):
	if body.is_in_group("player"):
		fire = true

func _on_PlayerDetect_body_exited(body):
	if body.is_in_group("player"):
		fire = false
