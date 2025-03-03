extends Area2D

var hp = 25
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
	rotation = rotation + deg_to_rad(5)
	if count % 10 == 0:
		var bangle = rad_to_deg(rotation)
		cshot($"N".global_position.x, $"N".global_position.y, bangle, 5)
		cshot($"N".global_position.x, $"N".global_position.y, bangle + 180, 5)

		cshot($"S".global_position.x, $"S".global_position.y, bangle, 5)
		cshot($"S".global_position.x, $"S".global_position.y, bangle + 180, 5)

		cshot($"E".global_position.x, $"E".global_position.y, bangle + 90, 5)
		cshot($"E".global_position.x, $"E".global_position.y, bangle + 270, 5)

		cshot($"W".global_position.x, $"W".global_position.y, bangle + 90, 5)
		cshot($"W".global_position.x, $"W".global_position.y, bangle + 270, 5)
	count = count + 1
