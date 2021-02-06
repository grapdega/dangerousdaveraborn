extends Node2D


onready var globals = get_node("/root/Globals")

var nums = {
	"0": preload("res://Images/number/0.png"),
	"1": preload("res://Images/number/1.png"),
	"2": preload("res://Images/number/2.png"),
	"3": preload("res://Images/number/3.png"),
	"4": preload("res://Images/number/4.png"),
	"5": preload("res://Images/number/5.png"),
	"6": preload("res://Images/number/6.png"),
	"7": preload("res://Images/number/7.png"),
	"8": preload("res://Images/number/8.png"),
	"9": preload("res://Images/number/9.png")
}

var numArr = []
func _process(_delta):
	for i in str(globals.player_score):
		numArr.append(i)
		
	$Score/Sprite5.set_texture(nums[numArr[0]])
	if globals.player_score >= 10:
		$Score/Sprite4.set_texture(nums[numArr[0]])
		$Score/Sprite5.set_texture(nums[numArr[1]])
	if globals.player_score >= 100:
		$Score/Sprite3.set_texture(nums[numArr[0]])
		$Score/Sprite4.set_texture(nums[numArr[1]])
		$Score/Sprite5.set_texture(nums[numArr[2]])
	if globals.player_score >= 1000:
		$Score/Sprite2.set_texture(nums[numArr[0]])
		$Score/Sprite3.set_texture(nums[numArr[1]])
		$Score/Sprite4.set_texture(nums[numArr[2]])
		$Score/Sprite5.set_texture(nums[numArr[3]])
	if globals.player_score >= 10000:
		$Score/Sprite1.set_texture(nums[numArr[0]])
		$Score/Sprite2.set_texture(nums[numArr[1]])
		$Score/Sprite3.set_texture(nums[numArr[2]])
		$Score/Sprite4.set_texture(nums[numArr[3]])
		$Score/Sprite5.set_texture(nums[numArr[4]])
		
	if self.visible == true and Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Prefabs/StartScreen.tscn")
