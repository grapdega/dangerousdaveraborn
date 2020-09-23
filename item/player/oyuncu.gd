extends KinematicBody2D

export var gravity=10
export var speed=40
export var runspeed=150
var height=15
export var hasClass = false
var velocity = Vector2.ZERO
var isLife = true
onready var raycast = $RayCast2D
onready var animation = $Sprite
onready var player_vars = get_node("/root/Globals")

func _physics_process(delta):
	if isLife:
		velocity.y+=gravity*delta*speed
		velocity = move_and_slide(velocity)
		if (Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_up")) and raycast.is_colliding():
			velocity.y-=speed*delta*gravity*height*(10/gravity)
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
	else:
		print("Death")
		
func _ready():
	self.add_to_group("player")
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("fire"):
		player_vars.healt -= 1
		if player_vars.healt == 0:
			isLife = false
		else:
			get_tree().reload_current_scene()
