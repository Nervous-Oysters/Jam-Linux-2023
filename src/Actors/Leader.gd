extends Rabbit

var numberRabbit
var followers = preload("res://src/Actors/Follower.tscn")
var player
var f_list = []

func _ready():
	reset()

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

	rabbit_process(delta)

func reset():
	$Sprite2D.modulate = Color(252./256, 10./256, 148./256)
