extends MarginContainer

var count : float

const clickSFX = preload("res://Assets/Audio/Click.wav") 

func _ready():
	
	position = Vector2(0 , -600)
	
	DiscordRPC.app_id = 1300391495333052506
	print("Discord working: " + str(DiscordRPC.get_is_discord_working()))
	
	DiscordRPC.state = "In Menu"
	#DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordRPC.large_image = "logo"
	DiscordRPC.large_image_text = "Just Pong"
	
	DiscordRPC.refresh() 

func _process(delta):
	if(!MainMusicPlayer.playing) :
		MainMusicPlayer._play_music_level()

	
	Intro()
	
	if Input.is_action_just_pressed("ESC") :
		get_tree().quit()
	
	

func Intro() -> void : 
	if (count <= 1) :
		count += 0.005
	position.y = EasingFunctions.ease_out_bounce(position.y , 0 , count)



func _on_p_1_vs_p_2_button_down() -> void:
	SfxPlayer.playSFX(clickSFX , 2)
	MainMusicPlayer._stop_music()
	get_tree().change_scene_to_file("res://Scenes/Game/p_1vsp_2.tscn")


func _on_options_button_down() -> void:
	SfxPlayer.playSFX(clickSFX , 2)
	get_tree().change_scene_to_file("res://Scenes/UI/options.tscn")
