extends Area2D

var speed = 0
var angle = 0
const type = "bullet"

func _process(delta):
	$"gazou".rotation = $"gazou".rotation + deg_to_rad(15)
	position.x = position.x + cos(deg_to_rad(angle)) * speed
	position.y = position.y + sin(deg_to_rad(angle)) * speed

	if global_position.x < 0 or global_position.y < 0 or global_position.x > 700 or global_position.y > 1000:
		queue_free()
