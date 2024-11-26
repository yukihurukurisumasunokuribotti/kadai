extends Node2D

var ziki = preload("res://tscn/ziki.tscn")

func _ready():
	var z = ziki.instantiate()
	add_child(z)

func _process(delta: float) -> void:
	pass
