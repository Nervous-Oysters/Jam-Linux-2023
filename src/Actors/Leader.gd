extends Rabbit

func _physics_process(delta):

	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		JUMPING = true
	if Input.is_action_just_released("jump"):
		JUMPING = false
	if Input.is_action_just_pressed("move_left"):
		LEFT = true
		DIRECTION = -1
	if Input.is_action_just_pressed("move_right"):
		RIGHT = true
		DIRECTION = 1
	if Input.is_action_just_released("move_left"):
		LEFT = false
		if RIGHT: DIRECTION = 1
		else: DIRECTION = 0
	if Input.is_action_just_released("move_right"):
		RIGHT = false
		if LEFT: DIRECTION = -1
		else: DIRECTION = 0

	rabbit_process(delta)