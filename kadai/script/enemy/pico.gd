extends Area2D

var hp = 5
const type = "enemy"
var movetype = 0
var count = 0

var moveangle = 0
var movespeed = 0
var moveframe = 0

var bullet0 = preload("res://tscn/bullet/bullet.tscn")

func hit(damage):
	hp = hp - damage

func cshot(x, y, angle, speed):
	var root = get_tree().root
	var bullet = bullet0.instantiate()
	bullet.position.x = x
	bullet.position.y = y
	bullet.angle = angle
	bullet.speed = speed
	root.add_child(bullet)

func pico0():
	if count < moveframe:
		position.x = position.x + movespeed * cos(deg_to_rad(moveangle))
		position.y = position.y + movespeed * sin(deg_to_rad(moveangle))
		
	elif count < 225:
		if count % 20 == 0:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			cshot(global_position.x, global_position.y, baseangle, 15)
			cshot(global_position.x, global_position.y, baseangle + 30, 15)
			cshot(global_position.x, global_position.y, baseangle - 30, 15)
	else:
		position.x = position.x - movespeed * cos(deg_to_rad(moveangle))
		position.y = position.y - movespeed * sin(deg_to_rad(moveangle))

func pico1():
	var toziki = atan2(g.zpy - global_position.y, g.zpx - global_position.x)
	position.x = position.x + cos(toziki)
	position.y = position.y + sin(toziki)
	
	if count % 45 == 0:
		cshot(position.x, position.y, rad_to_deg(toziki), 7)
		
func _process(delta):
	match movetype:
		0:
			pico0()
		1:
			pico1()	
	
	if position.y < -50 or position.x < -25 or position.y > 1050 or position.x > 725:
		queue_free()

	if hp < 0:
		queue_free()
		
	count = count + 1
