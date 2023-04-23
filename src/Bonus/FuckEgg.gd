extends Area2D

var numberRabbit
var rng = RandomNumberGenerator.new()
var followers = preload("res://src/Actors/Follower.tscn")
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	numberRabbit = rng.randi_range(2, 10)
	player = get_parent().get_node("Player")

func _on_body_entered(body):
	if body.name == "Player":
		for i in range(numberRabbit):
			var follower = followers.instantiate()
			follower.target = player
			print(follower)
			get_parent().add_child(follower)
		queue_free()
