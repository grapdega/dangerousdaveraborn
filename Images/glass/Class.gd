extends Area2D

onready var player_Vars = get_node("/root/Globals")
var bodyEntered = false
func _process(_delta):
	if bodyEntered == false:
		$AnimationPlayer.play("cup")
	else:
		$AnimationPlayer.play("fade_out")
		$Sound.play()
		player_Vars.player_score += 1000
		player_Vars.player_has_class = true
		yield($AnimationPlayer,"animation_finished")
		queue_free()
		
	if player_Vars.player_has_class:
		queue_free()
	

func _on_Class_body_entered(body):
	if body.is_in_group("player"):
		bodyEntered = true
