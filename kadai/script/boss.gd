extends Area2D
var count = 0
var hp = 2500

var bullet0 = preload("res://tscn/bullet/bullet0.tscn")

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

func _process(delta):
	if count % 30 == 0:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			cshot(global_position.x, global_position.y, baseangle, 10) 
	if count % 30 == 5:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			cshot(global_position.x, global_position.y, baseangle + 20, 10) 
			cshot(global_position.x, global_position.y, baseangle - 20, 10)
	if count % 30 == 10:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			cshot(global_position.x, global_position.y, baseangle, 10) 
			cshot(global_position.x, global_position.y, baseangle + 30, 10)
			cshot(global_position.x, global_position.y, baseangle - 30, 10)
	if count % 30 == 15:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			cshot(global_position.x, global_position.y, baseangle, 10) 
			cshot(global_position.x, global_position.y, baseangle + 20, 10)
			cshot(global_position.x, global_position.y, baseangle - 20, 10)
			cshot(global_position.x, global_position.y, baseangle + 40, 10)
			cshot(global_position.x, global_position.y, baseangle - 40, 10)


	count = count + 1
