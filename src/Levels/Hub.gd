extends Node2D


var followers = preload("res://src/Actors/Follower.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug"):
		var follower = followers.instantiate()
		follower.target = player
		add_child(follower)
