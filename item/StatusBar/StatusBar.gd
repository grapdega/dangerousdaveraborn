extends CanvasLayer

onready var globals = get_node("/root/Globals")

func _process(delta):
	$ScoreCount.text = str(globals.player_score)
	$LevelCount.text = str(globals.level)
	
	if globals.player_has_class:
		$DoorMessage.visible = true
	else: $DoorMessage.visible = false
	
	$DaveCount.value = globals.healt
