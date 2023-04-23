extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("bouncing")
	$Sprite.play("default")


func _on_body_entered(body):
	if "Follow" in body.name:
		

		queue_free()
