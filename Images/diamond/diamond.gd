extends Area2D
export var point=100
onready var player_vars = get_node("/root/Globals")



func _on_diamond_body_entered(body):
	if body.is_in_group("player"):
		player_vars.player_score += point
		$AnimationPlayer.play("fade_out")
		$Sound.play()
		yield($AnimationPlayer,"animation_finished")
		queue_free()
