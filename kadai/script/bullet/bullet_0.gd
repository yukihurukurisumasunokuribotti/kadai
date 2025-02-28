extends Area2D

var speed = 100
var angle = 0

func _process(delta):
	position.x = position.x + cos(deg_to_rad(angle)) * speed
	position.y = position.y + sin(deg_to_rad(angle)) * speed
