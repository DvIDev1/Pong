extends MarginContainer

var count : float

func _ready():
	
	position = Vector2(0 , -600)
	MainMusicPlayer._play_music_level()
	
	DiscordRPC.app_id = 1300391495333052506
	print("Discord working: " + str(DiscordRPC.get_is_discord_working()))
	
	DiscordRPC.state = "In Menu"
	#DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	DiscordRPC.large_image = "logo"
	DiscordRPC.large_image_text = "Just Pong"
	
	DiscordRPC.refresh() 

func _process(delta):
	Intro()
	
	

func Intro() -> void : 
	if (count <= 1) :
		count += 0.005
	position.y = EasingFunctions.ease_out_bounce(position.y , 0 , count)
