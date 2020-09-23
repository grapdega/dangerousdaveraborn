extends CanvasLayer

onready var globals = get_node("/root/Globals")

func _process(_delta):
	$ScoreCount.text = str(globals.player_score)
	$LevelCount.text = str(globals.level)
	
	if globals.player_has_class:
		$DoorMessage.visible = true
	else: $DoorMessage.visible = false
	
	if globals.hasJetpack:
		$JetpackNode.visible = true
	else: $JetpackNode.visible = false
	
	if globals.jetpackIsActive:
		$JetpackNode/JetpackCount.value -= 1
		if $JetpackNode/JetpackCount.value == 0:
			globals.jetpackIsActive= false
			globals.hasJetpack = false
			$JetpackNode.visible = false
	$DaveCount.value = globals.healt
	
