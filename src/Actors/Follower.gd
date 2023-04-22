extends Rabbit

var buffer = []
var rng = RandomNumberGenerator.new()
var base_time_deviation # in millisecond
var target

var left_count
var right_count

var jump_start
var jump_delta
var jump_time_done

var current_time

func _ready():
	base_time_deviation = rng.randf_range(0.1*1000, 0.5*1000)
	position = target.position
	left_count = 0
	right_count = 0
	jump_start = null
	jump_delta = 0
	jump_time_done = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
	current_time = Engine.get_frames_drawn()
	
	# could optimize by not checking once behind current timing
	# but noise make it complex
	var to_remove = []
	for i in range(buffer.size()):
		if buffer[i][1] <= current_time:
			to_remove.append(i)
			for input in buffer[i][0]:
				perform(input)
	
	
	# remove from the end, if we don't index will move and won't be correct
	for i in range(1, to_remove.size() + 1):
		buffer.remove_at(to_remove[-i])
	
	# Add currently pressed inputs to the list
	# Use 'just_pressed' to allow the player to hold multiple direction 
	# and the last pressed is the action perfomed
	var pressed_inputs = []
	if Input.is_action_just_pressed("move_right"):
		pressed_inputs.append("press_right")
	if Input.is_action_just_pressed("move_left"):
		pressed_inputs.append("press_left")
	if Input.is_action_just_released("move_right"):
		pressed_inputs.append("release_right")
	if Input.is_action_just_released("move_left"):
		pressed_inputs.append("release_left")
		
	# jump is handle differently because there's can't be many noise. 
	# With too much noise, jump become always too high
	if Input.is_action_just_pressed("jump"):
		pressed_inputs.append("press_jump")
		jump_start = current_time
	if Input.is_action_just_released("jump"):
		jump_delta = current_time - jump_start
		print("Delta : ", jump_delta)
		jump_start = null
	if jump_time_done != null and jump_delta+jump_time_done <= current_time:
		print("End at : ", current_time)
		JUMPING = false
		jump_time_done = null
		jump_delta = 0

	# base the noise on the distance with the player. Should try coef
	var dist = position.distance_to(target.position)
	var noise = abs(rng.randfn(0., abs(dist))) / 100
	
	# add in a buffer, the inputs and the timing to perfom them
	# We add a base deviation and a noise
	if pressed_inputs:
		buffer.append([pressed_inputs,
		max(current_time + base_time_deviation - noise, current_time)])
		# Problem : if I generate the timing now and not when the follow should 
		# do the action, the noise won't be very correct. For now, not a problem
		
	rabbit_process(delta)

func perform(action):
	match action:
		"press_right":
			right_count += 1
			if right_count < 1: return
			RIGHT = true
			DIRECTION = 1
		"press_left":
			left_count += 1
			if left_count < 1: return
			LEFT = true
			DIRECTION = -1
		"release_left":
			left_count -= 1
			LEFT = false
			if RIGHT: DIRECTION = 1
			else: DIRECTION = 0
		"release_right":
			right_count -= 1
			RIGHT = false
			if LEFT: DIRECTION = -1
			else: DIRECTION = 0
		"press_jump":
			JUMPING = true
			print("Jump done at : ", current_time)
			print("Should end at : ", current_time + jump_delta)
			jump_time_done = current_time
