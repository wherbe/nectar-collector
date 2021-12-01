extends Control

func _ready():
	var music = get_node("/root/MusicController/Music")
	music.stop()

func _on_BackButton_pressed():
	get_tree().change_scene("res://src/MainMenu.tscn")
