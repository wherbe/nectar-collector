extends Control

var score = 0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	get_node("/root/ScoreCounter").keep_score = false
	score = get_node("/root/ScoreCounter").score
	$Score.text = str(score)
	
	var music = get_node("/root/MusicController/Music")
	music.stop()

func _on_RestartButton_pressed():
	get_tree().change_scene("res://src/Game.tscn")

func _on_MenuButton_pressed():
	get_tree().change_scene("res://src/MainMenu.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
