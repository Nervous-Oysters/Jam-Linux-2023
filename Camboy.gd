extends CharacterBody2D


const SPEED = 90.0


# Get the gravity from the project settings to be synced with RigidBody nodes.


func _physics_process(delta):
	# Add the gravity.


	velocity.x = SPEED
	move_and_slide()
