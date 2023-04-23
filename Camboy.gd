extends CharacterBody2D


const SPEED = 60.0
var player
var down = false
var right = false

func _ready():
	velocity.x = SPEED

func _physics_process(delta):
	# Add the gravity.

	if player.position.y > 500 and not down:
		position = Vector2(464, 528)
		down = true
	
	if player.position.x > 1192 and not right:
		position = Vector2(1236, 400)
		right = true
	
	move_and_slide()
