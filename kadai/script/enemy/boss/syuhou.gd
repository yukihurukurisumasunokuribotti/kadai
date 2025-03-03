extends Area2D

var hp = 100
const type = "tizyou"
var count = 0
var engine = 0

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

	if $"../../".phase == 8:
		engine = 1

	if engine == 1:
		if count % 300 < 250:
			rotation = toziki + deg_to_rad(-90)

			if count % 20 == 0:
				var shotx = $"fugen".global_position.x
				var shoty = $"fugen".global_position.y
				for i in range(5):
					for ro in range(5):
						cshot(shotx, shoty, rad_to_deg(toziki) - ro * 15, 1 + i)

				shotx = $"monju".global_position.x
				shoty = $"monju".global_position.y
				for i in range(5):
					for ro in range(5):
						cshot(shotx, shoty, rad_to_deg(toziki) + ro * 15, 1 + i)

		else:
			if count % 20 == 0:
				var shotx = $"shaka".global_position.x
				var shoty = $"shaka".global_position.y
				rotation = deg_to_rad(-30)
				for i in range(8):
					cshot(shotx, shoty, (360 / 8) * i + randf_range(0, 360), 5)
				for i in range(10):
					cshot(shotx, shoty, (360 / 10) * i + randf_range(0, 360), 9)
			if count % 20 == 10:
				var shotx = $"shaka".global_position.x
				var shoty = $"shaka".global_position.y
				rotation = deg_to_rad(30)
				for i in range(8):
					cshot(shotx, shoty, (360 / 8) * i + randf_range(0, 360), 5)
				for i in range(10):
					cshot(shotx, shoty, (360 / 10) * i + randf_range(0, 360), 9)		
			
		
		count = count + 1
