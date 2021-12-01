extends Area2D

var mousePos = Vector2.ZERO

func _process(_delta):
	mousePos = get_global_mouse_position()
	position = mousePos
