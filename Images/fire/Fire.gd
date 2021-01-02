extends Area2D
var delay=0;
var time=0;
func _init():
	delay=rand_range(0,1)

func _process(_delta):
	if(delay<time):
		$FireSprite.play("fire")
	else:
		time+=_delta
