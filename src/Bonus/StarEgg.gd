extends Area2D

var TIMER = 240 # in frame

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_body_entered(body):
	if body.name == "Player":
		var followers = []
		for child in get_parent().get_children():
			if "Follow" in child.name: child.INVINCIBILITY = TIMER
		body.INVINCIBILITY = TIMER

		queue_free()
