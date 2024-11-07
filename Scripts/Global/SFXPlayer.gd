extends AudioStreamPlayer

func playSFX(sfx: AudioStream , volume = 0.0) :
	
	stream = sfx
	
	volume_db = volume
	
	play()
