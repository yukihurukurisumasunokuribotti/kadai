extends Sprite2D

var ziki = preload("res://tscn/ziki.tscn")
var boss = preload("res://tscn/enemy/boss.tscn")
var count = 0
var phase = 0

var table = [
preload("res://tscn/enemy/tairetu/iss1.tscn"),
preload("res://tscn/enemy/tairetu/iss2.tscn"),
preload("res://tscn/enemy/tairetu/pico0.tscn"),
preload("res://tscn/enemy/tairetu/pico1.tscn"),
preload("res://tscn/enemy/tairetu/pico2.tscn")]
var now = 0

func nexttairetu():
	var root = get_tree().root
	var tairetu = table[now % 5].instantiate()
	root.add_child(tairetu)
	now = now + 1

func _ready():
	var z = ziki.instantiate()
	z.global_position.x = 350
	z.global_position.y = 700
	get_tree().root.add_child(z)
	print("a")

func _process(delta):
	if count % 300 == 0:
		nexttairetu()
		
	match phase:
		0:
			position.y = position.y + 2

			if position.y >= 2500:
				phase = 1

		1:
			phase = 2
			$"joudo/boss".next()
	count = count + 1
