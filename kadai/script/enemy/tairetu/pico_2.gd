extends Node2D

var enemy1 = preload("res://tscn/enemy/pico.tscn")

func _ready():

	var pico = enemy1.instantiate()
	pico.position.x = 650
	pico.position.y = -50
	pico.moveangle = 120
	pico.movespeed = 10
	pico.moveframe = 20
	pico.movetype = 0
	add_child(pico)

	pico = enemy1.instantiate()
	pico.position.x = 750
	pico.position.y = 450
	pico.moveangle = 165
	pico.movespeed = 10
	pico.moveframe = 15
	pico.movetype = 0
	add_child(pico)
	
	pico = enemy1.instantiate()
	pico.position.x = 750
	pico.position.y = 200
	pico.moveangle = 150
	pico.movespeed = 10
	pico.moveframe = 20
	pico.movetype = 0
	add_child(pico)
