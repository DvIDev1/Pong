extends Control

var MusicBus = AudioServer.get_bus_index("Music")

var SFXBus = AudioServer.get_bus_index("SFX")

@export var scenePath : String 

@export var MusicSlider : HSlider

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MusicBus , value)
	
	if value == MusicSlider.min_value:
		AudioServer.set_bus_mute(MusicBus , true)
	else:
		AudioServer.set_bus_mute(MusicBus , false)
		
		


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFXBus , value)
	
	if value == MusicSlider.min_value:
		AudioServer.set_bus_mute(SFXBus , true)
	else:
		AudioServer.set_bus_mute(SFXBus , false)
		


func _on_back_pressed():
	get_tree().change_scene_to_file(scenePath)
