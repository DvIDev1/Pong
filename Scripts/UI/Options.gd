extends TextureButton

func _pressed():
	get_tree().change_scene_to_file("res://Scenes/UI/options.tscn")
