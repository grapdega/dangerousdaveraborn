extends Area2D
export var point=100
onready var globals = get_node("/root/Globals")

func _on_diamond_body_entered(body):
	if body.is_in_group("player"):
		globals.player_score += point
		$AnimationPlayer.play("fade_out")
		if globals.musicActive:
			$Sound.play()
		yield($AnimationPlayer,"animation_finished")
		queue_free()
