extends Node2D
onready var globals = get_node("/root/Globals")

func _ready():
	globals.level=0
	globals.isLife = true
	globals.healt=5

func _process(delta):
	$AnimatedSprite.play("dave")
	
func _input(event):
	if event is InputEventKey:
		if event.pressed and event.is_action_pressed("fire"):
			get_tree().change_scene("res://level/testlevel.tscn")
   
