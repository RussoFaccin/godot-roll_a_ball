extends Area

var randVector
const SPEED = 5;
signal updateCounter

func _ready():
	randomize()
	randVector = randomRotate()
	print(randVector)
	var rootNode = get_node("/root")
	connect("area_entered", self, "onPickUp")

func _process(delta):
	rotate(randVector.normalized(), delta*SPEED)


func _onPickUp(body):
	if (body.get_name() == "Character"):
		emit_signal("updateCounter")
		queue_free()
		
func randomRotate():
	var randVector3 = Vector3(
		rand_range(0.0, 1.0),
		rand_range(0.0, 1.0),
		rand_range(0.0, 1.0)
	)

	return randVector3