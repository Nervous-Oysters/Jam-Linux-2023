extends Area2D

func _ready():
	$AnimatedSprite2D.play("default")

func _process(delta):
	$AnimatedSprite2D.play("default")
