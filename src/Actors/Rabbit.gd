extends CharacterBody2D
class_name Rabbit

const SPEED = 300.0
const JUMP_VELOCITY = -300.0
var DIRECTION = 0
var CURRENT_JUMP = 0.0
var JUMPING = false
var LEFT = false
var RIGHT = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func rabbit_process(delta):
	# Handle Jump.
	if is_on_floor() and JUMPING:
		CURRENT_JUMP = JUMP_VELOCITY
		velocity.y = CURRENT_JUMP
	if not is_on_floor() and JUMPING:
		CURRENT_JUMP -= CURRENT_JUMP * delta*20
		velocity.y += CURRENT_JUMP
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if not JUMPING:
		CURRENT_JUMP = 0.0

	# move left and right
	if DIRECTION:
		velocity.x = DIRECTION * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
