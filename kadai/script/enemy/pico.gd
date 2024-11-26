extends Area2D

var count = 0
var type = 0

var bullet0 = preload("res://tscn/bullet/bullet0.tscn")

func cshot(x, y, angle, speed, tama):
	var root = get_tree().root
	var bullet = tama.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.position.angle = angle
	bullet.position.speed = speed
	root.add_child(bullet)


func pico0(count):
	if count < 45:
		position.x = position.x + 10
		position.y = position.y + 3
		
	elif count < 225:
		
		cshot(global_position.x, global_position.y, )


func pico1(count):
	pass

func _process(delta):
	match type:
		0:
			pico0(count)
		1:
			pico1(count)
	
	count = count + 1
