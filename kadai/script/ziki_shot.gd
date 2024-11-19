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


#ゲームである以上こいつを忘れちゃならねえ、判定です。
#弾がヒットしたときに相手側にあるbraked関数を呼び出します。
#このときの便宜を図るために判定を持つオブジェクト(敵など)の第一級ノードは必ずArea2Dにしてください。必ずです。"必ず"!
func _on_area_entered(area: Area2D) -> void:
	if area.type == "enemy" or area.type == "tizyou":
		area.breaked()
