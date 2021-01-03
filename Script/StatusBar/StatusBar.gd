extends CanvasLayer

onready var globals = get_node("/root/Globals")

var nums = {
	"0": preload("res://Images/number/num0.png"),
	"1": preload("res://Images/number/num1.png"),
	"2": preload("res://Images/number/num2.png"),
	"3": preload("res://Images/number/num3.png"),
	"4": preload("res://Images/number/num4.png"),
	"5": preload("res://Images/number/num5.png"),
	"6": preload("res://Images/number/num6.png"),
	"7": preload("res://Images/number/num7.png"),
	"8": preload("res://Images/number/num8.png"),
	"9": preload("res://Images/number/num9.png")
}

func _ready():
	if globals.godmode:
		globals.hasJetpack=true
		globals.hasGun=true
		globals.player_has_class=true

var numArr = []
var levelArr = []
func _process(_delta):
	for i in str(globals.player_score):
		numArr.append(i)
		
	for i in str(globals.level):
		levelArr.append(i)
		
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
	numArr.clear()
	
	$Level/Sprite2.set_texture(nums[levelArr[0]])
	if globals.level >= 10:
		$Level/Sprite1.set_texture(nums[levelArr[0]])
		$Level/Sprite2.set_texture(nums[levelArr[1]])
	levelArr.clear()
	
	if globals.player_has_class:
		$DoorMessage.visible = true
	else: $DoorMessage.visible = false
	
	if globals.hasJetpack:
		$JetpackNode.visible = true
	else: $JetpackNode.visible = false
	
	if globals.hasGun:
		$GunNode.visible = true
	else: $GunNode.visible = false
	
	if globals.jetpackIsActive:
		if false == globals.godmode:
			$JetpackNode/JetpackCount.value -= 1
		if $JetpackNode/JetpackCount.value == 0:
			globals.jetpackIsActive= false
			globals.hasJetpack = false
			$JetpackNode.visible = false
	$Daves/DaveCount.value = globals.healt
	
