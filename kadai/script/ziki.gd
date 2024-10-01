extends Area2D

#これは自機(自分が操作する機体)のスクリプトです。
#参考になれば幸いです。

var cooltime = 0
var shot = preload("res://tscn/ziki_shot.tscn")
const type = "ziki"
#cooltimeが何なのかは、後ほど。
#shotは自機のショットです。こちらも詳しくは後ほど。
#typeを定数として定義しました。これはこの判定が何の判定であるかを表します。
#これがあれば、当たった相手の種類で動作を制御することができます。

func _process(delta: float) -> void:
	var speed = 0
	var x = 0
	var y = 0

	#上のxとyは仮の数値です。
	#以下の四つのif節にて値を決めて行きます。
	if Input.is_action_pressed("ui_up"):
		y = y - 1
		speed = 5
		#ここでyをひとつ減らしました。上キーを押しているため、後の処理にてy座標がマイナスされ、自機が上に移動します。
		#そもそもコンピュータ上での座標の扱い方は数学の授業とはちょっと違い、上に行くほどyが小さくなります。
		#直接y座標をマイナスしないのにはちょっとした理由がありますが、後ほど。
		#また、speedを0から5にしました。予め0にしておき、方向キーが入力されたときのみ5になります。
		#これによって何も入力しないときに勝手に移動するのを防ぐことができます。
	if Input.is_action_pressed("ui_down"):
		y = y + 1
		speed = 5
	if Input.is_action_pressed("ui_left"):
		x = x - 1
		speed = 5
	if Input.is_action_pressed("ui_right"):
		x = x + 1
		speed = 5

	var moveangle = atan2(y, x)
	#ここで移動する角度を計算しています。
	#atan2関数は後もよく使う関数で、y座標とx座標を入れると角度を"ラジアンで"返してくれます。
	#他の三角関数も角度をラジアンとして計算しているので、三角関数同士だけで使う分には問題はありませんが、自分で角度を入れるときには注意してください。

	position.x = position.x + cos(moveangle) * speed
	position.y = position.y + sin(moveangle) * speed
	#実際に座標を移動しているのがこちらになります。
	#先程計算した角度を使ってspeed分だけ移動しています。
	#atan2は両方に0が入ると0を返してしまい、xのcos0は1、yのsin0は0なので何も入力していないときに勝手に右に動いてしまいます。
	#それを防ぐために方向キーを押された時だけ5を代入する必要があったんですね。
	#さて、三角関数まで使って移動を制御したのには理由があります。
	#とはいえその理由は至って単純、直接移動すると斜めに移動するときにルート2＝1.41421356...倍速くなってしまうのです。
	#座標のいじり方を正方形から単位円のspeed倍にすることによって、違和感なく移動できるといった寸法です。

	#さて、今度は自機のショットの発射もついでに書いていきます。
	#とは言え、ちょっと複雑になっちゃったけど、許してチョ。

	if Input.is_action_pressed("ui_shot"):
		#新たに、ショットのボタンを追加しました。
		#ボタンの追加は、画面上部のメニューのプロジェクト->プロジェクト設定->インプットマップからできます。
		#新しい操作を追加するには"新しいアクションの追加"にアクション名を入れると下の表に追加されます。
		#追加したアクションの横に＋ボタンがあるはずなので、あとはよしなに頼むぜ！

		var cool = 60
		cooltime = cooltime + 1
		if cooltime == cool:
			cooltime = 0
	else:
		cooltime = 59
		#ショットボタンを押したときと押さぬときの処理です。
		#このif-else節の後にcooltimeが0ならばショットが打たれるといった寸法です。
		#押しっぱなしならcooltimeが60になると==一秒経過するとcooltimeが再び0になりショットが放たれるという仕組みです。
		#押していなければcooltimeが59になり、次に押したときに0になり、ショットが放たれます。
		#つまり押しっぱなしならば秒間一発、連打すれば連打しただけショットが出てきます。昔のシューティングみたいですね。
		#coolの値をもっと小さくすれば、イルベロの装備1みたいな"連射コン使えるけどそこまで必要ない"って感じになります。

	if cooltime == 0:
		#ショットを放ったり、逆に敵の弾を撃ったりするには、インスタンス化が最も手っ取り早いです。
		#(真に勝手ながら)自機のショットのオブジェクトを作らせていただきました。

		var s = shot.instantiate()
		#ショットのインスタンスを作成しました。instantiate関数はインスタンスを作り、作成したインスタンスを返します。
		#身近なもので例えると、チョコレートを型に流し込み、できたチョコをsとして扱っているわけです。
		s.global_position.x = global_position.x + 65
		s.global_position.y = global_position.y - 65
		#さて、ここではできたインスタンスに調整を加えていきます。ここでは座標の設定をしています。
		#座標の変数がpositionではなくglobal_positionになっているのは自分から見た相対的な座標ではなく、絶対的な座標で扱うためです。
		s.angle = deg_to_rad(-45)
		#angleを設定しました。これでショットがどの向きに放たれるか決めています。
		#deg_to_radは度数法で表された角度をラジアンに変換する関数です。
		get_tree().root.add_child(s)
		#色々設定したインスタンスをついに動作させる時が来ました！
		#get_tree().rootはルートノード(一番親分のノード)を表します。そしてadd_childでルートノードの子分に加えるといった寸法です。
		#ルートノードは移動しないので、ショットが妙な動きを見せるということはありません。
		#あとはコイツらをコピペしてちょっといじって、終わり！

		s = shot.instantiate()
		s.global_position.x = global_position.x - 65
		s.global_position.y = global_position.y - 65
		s.angle = deg_to_rad(-135)
		get_tree().root.add_child(s)

		s = shot.instantiate()
		s.global_position.x = global_position.x
		s.global_position.y = global_position.y - 65
		s.angle = deg_to_rad(-90)
		get_tree().root.add_child(s)
		
