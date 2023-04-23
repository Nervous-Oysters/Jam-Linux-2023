extends Node2D


var followers = preload("res://src/Actors/Follower.tscn")
var player
var f_list
var cam
var START = Vector2(184, 344)
var END = 1700

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("Player")
	cam = get_node("Camboy")
	cam.player = player
	cam.position = START
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
		
	if player.position.x > END:
		get_tree().change_scene_to_file("res://src/Levels/End.tscn")
