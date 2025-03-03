extends Node2D

var ziki = preload("res://tscn/ziki.tscn")
var stage1 = preload("res://tscn/stage/stage1/base.tscn")

func newziki():
	var z = ziki.instantiate()
	position.x = 350
	position.y = 700
	add_child(z)

func start():
	var stage = stage1.instantiate()
	add_child(stage)
	newziki()
	
func _ready():
	start()
