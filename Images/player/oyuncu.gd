extends KinematicBody2D

export var gravity=7
export var speed=50
export var runspeed=80
export var maxgravity=70
export var height=16
export var hasClass = false
export var rightlimit = 99999
var velocity = Vector2.ZERO
var isLife = true
export var canFire = true
var inTree = false
onready var animation = $Sprite
onready var globals = get_node("/root/Globals")
const BULLET = preload("res://Prefabs/Bullet.tscn")
var paused=false

func _ready():
	self.add_to_group("player")
	$Camera2D.limit_right=rightlimit

func _physics_process(delta):
	if paused:
		return
	$Camera2D.global_position.x=640*(int((global_position.x)/640))
	if isLife:
		if Input.is_action_just_pressed("godmode"):
			globals.godmode=true
			globals.healt=-1
			globals.hasGun=true
			globals.hasJetpack=true
			globals.player_has_class=true
		velocity = move_and_slide(velocity)
		if Input.is_action_just_pressed("jetpack") and globals.hasJetpack:
			$JetpackSound1.play()
			globals.jetpackIsActive = !globals.jetpackIsActive
		if globals.jetpackIsActive:
			animation.play("jetpack")
			jetpack_move(delta)
		elif inTree:
			climb(delta)
		else:
			move(delta)
		if Input.is_action_just_pressed("fire") and globals.hasGun and canFire:
			var bullet = BULLET.instance()
			get_parent().add_child(bullet)
			bullet.position = Vector2(global_position.x + (globals.playerDirection*21),global_position.y)
			if false == globals.godmode:
				canFire = false
				$Timer.start()
		velocity = move_and_slide(velocity)
		if self.global_position.y > 360:
			self.global_position.y = -40
		velocity = move_and_slide(velocity)
		
		
	else:
		animation.play("dead")

func jetpack_move(delta):
	if not $JetpackSound2.playing:
		$JetpackSound2.play()
	if Input.is_action_pressed("jump"):
		velocity.y = -speed*delta*runspeed
		animation.play("jetpack")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed*delta*runspeed
		animation.play("jetpack")
	elif Input.is_action_pressed("left"):
		velocity.x=-speed*delta*runspeed
		globals.playerDirection=-1
		animation.play("jetpack")
		animation.flip_h=true
	elif Input.is_action_pressed("right"):
		globals.playerDirection=1
		velocity.x=+speed*delta*runspeed
		animation.play("jetpack")
		animation.flip_h=false
	else:
		velocity.y = 0
		velocity.x = 0

func move(delta):
	velocity.y+=gravity*delta*speed
	if velocity.y>maxgravity:
		velocity.y=maxgravity
	if Input.is_action_pressed("jump") and is_on_floor():
		if not $JumpSound.playing:
			$JumpSound.play()
		velocity.y-=speed*delta*gravity*height
	if Input.is_action_pressed("left"):
		if not $WalkSound.playing:
			$WalkSound.play()
		globals.playerDirection=-1
		velocity.x=-speed*delta*runspeed
		animation.flip_h=true
		animation.play("walk")
	elif Input.is_action_pressed("right"):
		if not $WalkSound.playing:
			$WalkSound.play()
		globals.playerDirection=1
		velocity.x=+speed*delta*runspeed
		animation.flip_h=false
		animation.play("walk")
	else:
		velocity.x=0
		animation.play("stop")
		$WalkSound.stop()
		
	if not is_on_floor():
		animation.play("jump")
		$WalkSound.stop()

func climb(delta):
	if Input.is_action_pressed("jump"):
		velocity.y = -speed*delta*runspeed
		if !is_on_floor():animation.play("climb")
	elif Input.is_action_pressed("ui_down"):
		velocity.y = speed*delta*runspeed
		if !is_on_floor():animation.play("climb")
	elif Input.is_action_pressed("left"):
		velocity.x=-speed*delta*runspeed
		globals.playerDirection=-1
		if !is_on_floor():animation.play("climb")
	elif Input.is_action_pressed("right"):
		velocity.x=+speed*delta*runspeed
		globals.playerDirection=1
		if !is_on_floor():animation.play("climb")
	else:
		velocity.y = 0
		velocity.x = 0
		animation.stop()

func _on_Area2D_area_entered(area):
	if area.is_in_group("tree"):
		inTree = true
	if area.is_in_group("hit"):
		dead()
	
func dead():
	if globals.godmode:
		return
	globals.healt -= 1
	paused=true
	var i=0
	while i<20:
		animation.play("dead")
		yield(animation,"animation_finished")
		i=i+1
	if globals.healt == 0:
		isLife = false
	else:
		get_tree().reload_current_scene()

func _on_Area2D_area_exited(area):
	if area.is_in_group("tree"):
		inTree = false

func _on_Timer_timeout():
	canFire = true

func _on_JumpSound_finished():
	$FallSound.play()

func is_on_floor():
	var direction=0
	velocity = move_and_slide(velocity)	
	if is_on_wall():
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			direction=collision.normal.y
			if direction == -1:
				return true
		return false

