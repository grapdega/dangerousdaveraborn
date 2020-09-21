extends KinematicBody2D

export var gravity=9.81
export var speed=80
export var runspeed=150
export var height=25
var velocity = Vector2.ZERO
onready var raycast = $RayCast2D
onready var animation = $Sprite
func _physics_process(delta):
	velocity.y+=gravity*delta*speed
	velocity = move_and_slide(velocity)
	if Input.is_action_pressed("ui_accept") and raycast.is_colliding():
		velocity.y-=speed*delta*gravity*height
	if Input.is_action_pressed("ui_left"):
		velocity.x=-speed*delta*runspeed
		animation.flip_h=true
		animation.play("walk")
	elif Input.is_action_pressed("ui_right"):
		velocity.x=+speed*delta*runspeed
		animation.flip_h=false
		animation.play("walk")
	else:
		velocity.x=0
		animation.play("stop")
	
	if not raycast.is_colliding():
		animation.play("jump")
	velocity = move_and_slide(velocity)

func _ready():
	self.add_to_group("player")
	
