extends Area2D

var hp = 5
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
	if global_position.y > -45 or global_position.y < 825 or global_position.x > -25 or global_position.x < 625:
		var toziki = atan2(g.zpy - global_position.y, g.zpx - global_position.x)
		rotation = toziki - deg_to_rad(90)
		
		if count % 20 == 0:
			cshot(global_position.x + rad_to_deg(cos(rotation + deg_to_rad(90))), global_position.y + rad_to_deg(sin(rotation + deg_to_rad(90))), rad_to_deg(rotation) + 90, 10)

	count = count + 1
