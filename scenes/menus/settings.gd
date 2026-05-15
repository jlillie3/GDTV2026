extends ColorRect

@onready var music_slider = $VBoxContainer/MusicSlider

func _ready():
	music_slider.grab_focus()

func _on_back_button_pressed():
	SceneChanger.close_scene()
