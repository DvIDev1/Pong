extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainMusicPlayer.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ESC") :
		get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
		
	pass
