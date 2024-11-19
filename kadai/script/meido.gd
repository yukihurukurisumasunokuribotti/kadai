extends Area2D

func _process(delta: float) -> void:
	var movex = 0
	var movey = 0
	var move = 0
	if Input.is_action_pressed("ui_left"):
		movex = movex - 1
		move = 1
	if Input.is_action_pressed("ui_right"):
		movex = movex + 1
		move = 1
	if Input.is_action_pressed("ui_up"):
		movey = movey - 1
		move = 1
	if Input.is_action_pressed("ui_down"):
		movey = movey + 1
		move = 1
		
	var speed = 3
	var moveangle = atan2(0 - movey, 0 - movex)
	if move == 1:
		position.x = position.x + cos(moveangle) * speed
		position.y = position.y + sin(moveangle) * speed
