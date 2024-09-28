extends Area2D

#自機のショットのスクリプトです。

const type = "shot"
var angle = 0

func _process(delta: float) -> void:
	global_position.x = global_position.x + cos(angle) * 10
	global_position.y = global_position.y + sin(angle) * 10
	rotation = angle
	#angleはショットの角度を表します。これはインスタンス化する時点で入力します。
	#また、sinとcosの後ろの*10は速さを表します。
