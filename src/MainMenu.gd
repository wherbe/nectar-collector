extends Control


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var music = get_node("/root/MusicController/Music")
	music.stop()

func _on_PlayButton_pressed():
	get_tree().change_scene("res://src/Game.tscn")

func _on_TutorialButton_pressed():
	get_tree().change_scene("res://src/Tutorial.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
