extends Node2D

const bat = preload("res://src/Bat.tscn")

var nectar_count = 30
var damage = 0.0

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	randomize()
	var music = get_node("/root/MusicController/Music")
	music.play()
	get_node("/root/ScoreCounter").score = 0
	get_node("/root/ScoreCounter").keep_score = true
	get_node("/root/ScoreCounter/ScoreTimer").start()

func _process(delta):
	if damage != 0.0 and nectar_count > 0: 
		$Moth/AnimatedSprite.modulate = Color(1,0,0)
		$MothModulateTimer.start()
		nectar_count -= damage * delta
	if nectar_count < 0: 
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://src/GameOver.tscn")
	if nectar_count > 100: nectar_count = 100
	get_node("UI/NectarCount").text = str(int(nectar_count))
	get_node("UI/NectarBar").value = nectar_count

func _on_Lantern_area_entered(area):
	if area == $Moth:
		damage = 5.0

func _on_Lantern_area_exited(area):
	if area == $Moth:
		damage = 0.0

func _on_Moth_area_entered(area):
	if area.is_in_group("enemies"):
		if nectar_count <= 0: pass
		$Moth/AnimatedSprite.modulate = Color(1,0,0)
		$Bite.pitch_scale = rand_range(3.5, 4.5)
		$Bite.play()
		nectar_count -= 20
		$MothModulateTimer.start()

func _on_BatSpawnStart_timeout():
	$BatSpawnTimer.start()

func _on_BatSpawnTimer_timeout():
	var spawn = bat.instance()
#	spawn.position = spawn_position
	add_child(spawn)
	$BatSpawnTimer.wait_time *= 0.99

func _on_MothModulateTimer_timeout():
	$Moth/AnimatedSprite.modulate = Color(1,1,1)
