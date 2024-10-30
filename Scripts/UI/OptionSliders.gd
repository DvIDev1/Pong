extends Control

var MusicBus = AudioServer.get_bus_index("Music")

var SFXBus = AudioServer.get_bus_index("SFX")

const clickSFX = preload("res://Assets/Audio/Click.wav") 

@export var scenePath : String 

@export var MusicSlider : HSlider

@export var SFXSlider : HSlider

func _ready() -> void:
	MusicSlider.value = AudioServer.get_bus_volume_db(MusicBus)
	SFXSlider.value = AudioServer.get_bus_volume_db(SFXBus)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ESC") :
			get_tree().change_scene_to_file(scenePath)

func _on_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(MusicBus , value)
	
	if value == MusicSlider.min_value:
		AudioServer.set_bus_mute(MusicBus , true)
	else:
		AudioServer.set_bus_mute(MusicBus , false)
		
		


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(SFXBus , value)
	
	SfxPlayer.playSFX(clickSFX , 2)
	
	if value == MusicSlider.min_value:
		AudioServer.set_bus_mute(SFXBus , true)
	else:
		AudioServer.set_bus_mute(SFXBus , false)
		


func _on_back_pressed():
	SfxPlayer.playSFX(clickSFX , 2)
	get_tree().change_scene_to_file(scenePath)
