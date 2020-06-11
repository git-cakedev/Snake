extends Node2D

func _ready():
	var a = $"/root/GameEvents".spawn_coin()
	add_child(a)
