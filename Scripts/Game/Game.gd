extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MainMusicPlayer.stop()
	
	DiscordRPC.state = "In Game"
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordRPC.large_image = "logo"
	DiscordRPC.large_image_text = "Just Pong"
	
	DiscordRPC.refresh() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ESC") :
		get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
		
	pass
