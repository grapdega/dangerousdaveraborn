extends CanvasLayer

onready var player_vars = get_node("/root/Globals")

func _process(delta):
	$ScoreCount.text = str(player_vars.player_score)
	$LevelCount.text = str(player_vars.level)
	
	if player_vars.player_has_class:
		$DoorMessage.visible = true
	else: $DoorMessage.visible = false
	
	if player_vars.healt == 4:
		$DavesCount.visible = true
		$DavesCount2.visible = true
		$DavesCount3.visible = true
	elif player_vars.healt == 3:
		$DavesCount.visible = true
		$DavesCount2.visible = true
		$DavesCount3.visible = false
	elif player_vars.healt == 2:
		$DavesCount.visible = true
		$DavesCount2.visible = false
		$DavesCount3.visible = false
	elif player_vars.healt == 1:
		$DavesCount.visible = false
		$DavesCount2.visible = false
		$DavesCount3.visible = false
