extends Area2D

var speed = 100
var velocity = Vector2()

func _process(delta):
	velocity = transform.x * speed
	position += velocity * delta
