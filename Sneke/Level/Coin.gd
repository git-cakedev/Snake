extends Area2D

export var max_coins = 150
var coins_num = 0

func _process(delta):
	if overlaps_area(get_tree().get_root().get_node("Game/Snake")):
		queue_free()
		quicc()
		if coins_num < max_coins:
			spawn()


func spawn():
	var a = $"/root/GameEvents".spawn_coin()
	$"/root/Game/Coins".add_child(a)
	coins_num += 1

func quicc():
	if ($"/root/Game/Snake/Timer".wait_time > 0.15):
		$"/root/Game/Snake/Timer".wait_time -= 0.005
	
