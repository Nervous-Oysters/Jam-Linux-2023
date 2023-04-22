extends Rabbit
#@onready var animation = $AnimationPlayer

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
		animation.play("run")
		RIGHT = true
		DIRECTION = 1
	if Input.is_action_just_released("move_left"):
		animation.play("run")
		LEFT = false
		if RIGHT: DIRECTION = 1
		else: DIRECTION = 0
	if Input.is_action_just_released("move_right"):
		RIGHT = false
		if LEFT: DIRECTION = -1
		else: DIRECTION = 0
	if is_on_floor() :
		animation.play("run")

	rabbit_process(delta)
