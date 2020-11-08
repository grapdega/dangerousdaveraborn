extends Node2D


func _ready():
	pass

func _process(delta):
	$AnimatedSprite.play("dave")
	
func _input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene("res://level/Level1.tscn")
