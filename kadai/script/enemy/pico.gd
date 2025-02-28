extends Area2D

var count = 0
var type = 0

var bullet0 = preload("res://tscn/bullet/bullet0.tscn")

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = bullet0.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)


func pico0(count):
	if count < 45:
		position.x = position.x + 10
		position.y = position.y + 3
		
	elif count < 225:
		if count % 20 == 0:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			cshot(global_position.x, global_position.y, baseangle, 15)
			cshot(global_position.x, global_position.y, baseangle + 30, 15)
			cshot(global_position.x, global_position.y, baseangle - 30, 15)
	else:
		position.x = position.x - 10
		position.y = position.y - 3

func pico1(count):
	pass

func _process(delta):
	match type:
		0:
			pico0(count)
		1:
			pico1(count)
	
	count = count + 1
