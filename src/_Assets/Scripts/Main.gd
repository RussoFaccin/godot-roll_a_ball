extends Spatial

# class member variables
var camera
var player
var pickUps
var offset
var score = 0
var scoreTotal = 0
var scoreCounter
var messageText

func _ready():
	pickUps = get_node("PickUps")
	scoreTotal = pickUps.get_child_count()
	print("========== SCORE: ==========")
	print(scoreTotal)
	messageText = get_node("HUD/MessageText")
	camera = get_node("Camera")
	player = get_node("Character")
	offset = camera.translation - player.translation
	
	scoreCounter = get_node("HUD/ScoreControl/ScoreCount")
	scoreCounter.text = String(score)

func _physics_process(delta):
	camera.translation = player.translation + offset

func onUpdateCounter():
	score += 1
	scoreCounter.text = String(score)
	
	if (score == scoreTotal):
		messageText.text = "!!! VICTORY !!!"