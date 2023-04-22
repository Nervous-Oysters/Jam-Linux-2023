extends Area2D

var numberRabbit
var rng = RandomNumberGenerator.new()
var followers = preload("res://src/Actors/Follower.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	var anim: AnimationPlayer = get_node("AnimationPlayer")
	numberRabbit = rng.randi_range(2, 10)
	player = get_node("/root/Player")

func _on_body_entered(body):
	for i in range(numberRabbit):
		var follower = followers.instantiate()
		follower.target = player
		add_child(follower)
	queue_free()
