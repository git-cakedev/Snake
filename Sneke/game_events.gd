extends Node

const coin_scene = preload("res://Level/Coin.tscn")
const snake_scene = preload("res://Snake/Snake.tscn")
const tail_scene = preload("res://Snake/SnakeTail.tscn")
const body_scene = preload("res://Snake/SnakeBody.tscn")

var board_points = []
# body_parts [index (# of coins picked up), object, position, direction]
var body_parts = [index, object, position, direction]

var index
var object
var position
var direction

const width = 14
const height = 14
const cell_size = 8

func _ready():
	initialize_play_region()
	# board_points.append(0, body_scene, body_scene.position, 1)

func initialize_play_region():
	for x in range(1, width + 1):
		for y in range(1, height + 1):
			board_points.append(Vector2 (x * cell_size, y * cell_size))

func spawn_tail():
	pass

func spawn_body():
	pass

func spawn_coin():
	var coin = coin_scene.instance()
	coin.transform.origin = random_pos()
	return coin

func random_pos():
	randomize()
	return board_points[randi() % board_points.size()]
