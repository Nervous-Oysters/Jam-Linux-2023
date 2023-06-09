extends CharacterBody2D
class_name Rabbit

const SPEED = 250.0
const JUMP_VELOCITY = -150.0
var DIRECTION = 0
var CURRENT_JUMP = 0.0
var JUMPING = false
var LEFT = false
var RIGHT = false
var INVINCIBILITY = 0
var COLORS = [
	Color(1., 0., 0.),
	Color(0., 1., 0.),
	Color(0., 0., 1.),
	Color(0., 1., 1.),
	Color(1., 1., 0.),
	Color(1., 0., 1.),
	Color(0., 1., 0.4),
	Color(252./256, 10./256, 148./256)
	]
var rng = RandomNumberGenerator.new()

@onready var animation = $AnimationPlayer

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
	if is_on_floor():
		animation.play("run")
	else:
		animation.play("jump")
		
	if INVINCIBILITY == 1:
		reset()
	if INVINCIBILITY != 0:
		if INVINCIBILITY % 10 == 0:
			$Sprite2D.modulate = COLORS[rng.randi() % COLORS.size()]
		INVINCIBILITY -= 1


	# move left and right
	if DIRECTION: #1 : droite, -1 : gauche
		velocity.x = DIRECTION * SPEED
		if DIRECTION == -1 :
			$Sprite2D.flip_h = true
		else :
			$Sprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func reset():
	pass
