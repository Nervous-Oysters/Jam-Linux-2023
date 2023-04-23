extends Button


func _pressed() -> void:
	get_tree().change_scene_to_file("res://src/Levels/Hub.tscn")

func _ready() -> void:
	print("Button Ready")
