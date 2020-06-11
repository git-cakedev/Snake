extends Node

const coin_scene = preload("res://Level/Coin.tscn")

var board_points = []
const width = 14
const height = 14
const cell_size = 8

func _ready():
	initialize_play_region()


func initialize_play_region():
	for x in range(1, width + 1):
		for y in range(1, height + 1):
			board_points.append(Vector2 (x * cell_size, y * cell_size))

func spawn_coin():
	var coin = coin_scene.instance()
	coin.transform.origin = random_pos()
	return coin

func random_pos():
	randomize()
	return board_points[randi() % board_points.size()]
