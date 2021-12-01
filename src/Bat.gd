extends Area2D

const XSPEED = 30
const YSPEED = 90

var spawn_position = Vector2(150,-60)
var direction = 0

func _ready():
	randomize()
	direction = sign(rand_range(-1, 1))
	spawn_position.x = rand_range(0, 320)
	position = spawn_position

func _process(delta):
	position += Vector2(XSPEED*direction*delta, YSPEED*delta)
	
	if direction >= 0: $AnimatedSprite.flip_h = true
	elif direction < 0: $AnimatedSprite.flip_h = false
	
	if position.y > 400: 
		print("free")
		queue_free()

func _on_AnimatedSprite_frame_changed():
	if $AnimatedSprite.frame == 2 and position.y < 200:
		$BatFlap.pitch_scale = rand_range(0.8, 1.0)
		$BatFlap.play() 
