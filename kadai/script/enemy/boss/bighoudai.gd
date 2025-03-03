extends Area2D

var hp = 100
const type = "tizyou"
var count = 0

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


func _process(delta):
	var toziki = atan2(g.zpy - global_position.y, g.zpx - global_position.x)
	rotation = toziki + deg_to_rad(-90)
	if count % 30 == 0:
		var shotx = $"left".global_position.x
		var shoty = $"left".global_position.y
		for i in range(5):
			for ro in range(5):
				cshot(shotx, shoty, rad_to_deg(toziki) - ro * 15, 5 + i)

		shotx = $"right".global_position.x
		shoty = $"right".global_position.y
		for i in range(5):
			for ro in range(5):
				cshot(shotx, shoty, rad_to_deg(toziki) + ro * 15, 5 + i)


	if hp < 0:
		$"../../".next()
		queue_free()
		
	count = count + 1
