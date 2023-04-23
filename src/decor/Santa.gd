extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("bouncing")
	$Sprite.play("default")


func _on_body_entered(body):
	if body.name == "Player" or "follow" in body.name:
		for i in range(numberRabbit):
			var follower = followers.instantiate()
			follower.target = player
			print(follower)
			get_parent().add_child(follower)
		queue_free()
