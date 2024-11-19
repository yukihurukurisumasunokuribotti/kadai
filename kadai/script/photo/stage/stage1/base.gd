extends Sprite2D


var ziki = preload("res://tscn/ziki.tscn")
func _ready():
	var z = ziki.instantiate()
	z.global_position.x = 350
	z.global_position.y = 700
	get_tree().root.add_child(z)
	print("a")

func _process(delta: float) -> void:
	if position.y <= 2500:
		position.y = position.y + 2
