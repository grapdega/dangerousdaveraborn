extends Control
onready var globals = $"/root/Globals"

func _ready():
	$Focus.position = Vector2(246, 195)

func _process(delta):
	if globals.musicActive:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		
	if globals.musicActive:
		$SoundCheck.pressed = true
	else:
		$SoundCheck.pressed = false

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
	globals.musicActive = !globals.musicActive
