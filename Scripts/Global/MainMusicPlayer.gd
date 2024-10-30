extends AudioStreamPlayer

const Main_Music = preload("res://Assets/Audio/Pong_MainMenu.mp3")

func _play_music(music: AudioStream, volume: = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume
	play()

func _play_music_level():
	_play_music(Main_Music)
