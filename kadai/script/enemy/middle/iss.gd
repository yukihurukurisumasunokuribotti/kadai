extends Node2D

var hp = 50
const type = "enemy"
var count = 0

var basex = 0

var bullet0 = preload("res://tscn/bullet/bullet.tscn")
var pico = preload("res://tscn/enemy/pico.tscn")

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
	if count < 100:
		position.y = position.y + 3
		basex = position.x

	else:
		position.y = position.y + 0.5
		position.x = basex + sin(deg_to_rad((count - 100) * 2.0)) * 50
		if count % 50 == 0:
			var baseangle = rad_to_deg(atan2(g.zpy - global_position.y, g.zpx - global_position.x))
			for i in range(5):
				var angle = baseangle + randf_range(-15, 15)
				cshot(position.x + 75, position.y, angle, randf_range(3, 7))
				angle = baseangle + randf_range(-15, 15)
				cshot(position.x - 75, position.y, angle, randf_range(3, 7))

	if hp < 0:
		var root = get_tree().root
		var p = pico.instantiate()
		p.position.x = position.x + 75
		p.position.y = position.y
		p.movetype = 1
		root.add_child(p)
		
		p = pico.instantiate()
		p.position.x = position.x - 75
		p.position.y = position.y
		p.movetype = 1
		root.add_child(p)

		queue_free()
		
	count = count + 1
