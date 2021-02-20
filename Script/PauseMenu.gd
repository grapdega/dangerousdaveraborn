extends Control
onready var globals = $"/root/Globals"
func _ready():
	$Focus.position = Vector2(246, 195)
	$SoundCheck.pressed = true

func _process(delta):
	if $SoundCheck.is_pressed():
		globals.musicActive = true
	else:
		globals.musicActive = false
func _input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = !get_tree().paused
		self.visible = !self.visible

func _on_ExitGame_mouse_entered():
	$Focus.position = Vector2(246, 195)


func _on_ExitGame_pressed():
	get_tree().quit()


func _on_SoundCheck_mouse_entered():
	$Focus.position = Vector2(246, 226)


func _on_Sound_mouse_entered():
	$Focus.position = Vector2(246, 226)


func _on_SoundCheck_pressed():
	pass
