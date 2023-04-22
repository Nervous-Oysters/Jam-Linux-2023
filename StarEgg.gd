extends Area2D

var player
var followers = []
var TIMER = 600 # in frame

# Called when the node enters the scene tree for the first time.
func _ready():
	var anim: AnimationPlayer = get_node("AnimationPlayer")
	var children = get_parent().get_children()
	for child in children:
		var scene_file = child.name
		if "player" in child.name:
			player = child
			continue
		if "follower" in child.name:
			followers.append(child)

func _on_body_entered(body):
	player.INVINCIBILITY = TIMER
	for follower in followers:
		follower.INVINCIBILITY = TIMER
	queue_free()
