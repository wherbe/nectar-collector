extends Area2D

const SPEED = 50
var speed = 1

var mousePos = Vector2.ZERO
var randomDir = Vector2.ZERO
var direction = Vector2.ZERO
var negativeCheck = 0.5
var negative = 0

func _ready():
	randomize()

func _process(delta):
	speed = SPEED * delta
	
	mousePos = get_global_mouse_position()
	direction = (mousePos - position).normalized()
	
	negativeCheck = randf()
	if negativeCheck >= 0.5: negative = 1
	else: negative = -1
	
	randomDir.x = randf() * negative
	randomDir.y = randf() * negative
	
	randomDir = randomDir.normalized() * 1
	position.x = position.x + direction.x * speed + randomDir.x
	position.y = position.y + direction.y * speed + randomDir.y
#	position.x = position.x + direction.x * SPEED
#	position.y = position.y + direction.y * SPEED
	
	if mousePos.x >= position.x: $AnimatedSprite.flip_h = false
	elif mousePos.x < position.x: $AnimatedSprite.flip_h = true
	

