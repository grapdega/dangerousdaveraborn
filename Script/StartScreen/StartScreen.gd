extends Node2D


func _ready():
	pass

func _process(delta):
	$AnimatedSprite.play("dave")
	
func _input(event):
	if event is InputEventKey:
		if event.pressed and event.is_action_pressed("jump"):
			get_tree().change_scene("res://level/Level1.tscn")
		if event.pressed and event.is_action_pressed("fire"):
			get_tree().change_scene("res://level/testlevel.tscn")
   
