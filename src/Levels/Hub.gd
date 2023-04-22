extends Node2D


var followers = preload("res://src/Actors/Follower.tscn")
var player
var f_list

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	f_list = []

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("debug"):
		var follower = followers.instantiate()
		f_list.append(follower)
		follower.target = player
		add_child(follower)
	if Input.is_action_just_pressed("debug2"):
		for follower in f_list:
			if follower.is_inside_tree(): follower.queue_free()
		f_list = []
