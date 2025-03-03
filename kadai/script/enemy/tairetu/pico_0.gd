extends Node2D

var enemy1 = preload("res://tscn/enemy/pico.tscn")

func _ready():
	print("pico_0")

	var pico = enemy1.instantiate()
	pico.position.x = -50
	pico.position.y = 50
	pico.moveangle = 60
	pico.movespeed = 10
	pico.moveframe = 20
	pico.movetype = 0
	add_child(pico)
	
	pico = enemy1.instantiate()
	pico.position.x = 750
	pico.position.y = 50
	pico.moveangle = 120
	pico.movespeed = 10
	pico.moveframe = 20
	pico.movetype = 0
	add_child(pico)

	pico = enemy1.instantiate()
	pico.position.x = 350
	pico.position.y = -50
	pico.moveangle = 90
	pico.movespeed = 10
	pico.moveframe = 15
	pico.movetype = 0
	add_child(pico)
