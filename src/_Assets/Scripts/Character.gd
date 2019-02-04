extends RigidBody

export var SPEED = 10
var velocity = Vector3()

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _integrate_forces(state):
	handleInput()
	velocity = velocity.normalized() * SPEED
	state.add_force(velocity, Vector3(0, 0, 0))
	
func handleInput():
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_just_released("ui_right"):
		velocity.x = 0
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_just_released("ui_left"):
		velocity.x = 0
	if Input.is_action_pressed("ui_down"):
		velocity.z += 1
	if Input.is_action_just_released("ui_down"):
		velocity.z = 0
	if Input.is_action_pressed("ui_up"):
		velocity.z -= 1
	if Input.is_action_just_released("ui_up"):
		velocity.z = 0