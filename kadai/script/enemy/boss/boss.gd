extends Node2D
var count = 0
var phase = -1

func next():
	phase = phase + 1

func _process(delta):
	print(phase)
	match phase:
		-1:
			pass
		0:
			position.y = position.y + 2

			if position.y > 850:
				phase = phase + 1

		1:
			pass
			
		2:
			position.x = position.x - 2 
			position.y = position.y - 2
			if position.y < 350:
				phase = phase + 1

		3:
			position.x = position.x - 2
			if position.x <= -350:
				phase = phase + 1

		4:
			position.y = position.y + 2
			if position.y > 850:
				phase = phase + 1

		5:
			pass

		6:
			position.x = position.x + 2
			position.y = position.y - 0.5
			if position.x > 350:
				phase = phase + 1

		7:
			position.y = position.y + 2
			if position.y > 950:
				phase = phase + 1
