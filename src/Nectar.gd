extends Area2D

var frame = 0
var collectable = true

func _ready():
	randomize()
	frame = randi() % 3
	$AnimatedSprite.frame = frame

func _on_Nectar_area_entered(area):
	if area == get_parent().get_parent().get_node("Moth") and collectable:
		get_parent().get_parent().nectar_count += 2
		$NectarSlurp.pitch_scale = rand_range(2.30, 2.70)
		$NectarSlurp.play()
		$AnimatedSprite.modulate.a = 0.2
		collectable = false
		$ReplenishTimer.start()

func _on_ReplenishTimer_timeout():
	$AnimatedSprite.modulate.a = 1.0
	collectable = true
