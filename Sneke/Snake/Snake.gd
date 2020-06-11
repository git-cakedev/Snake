extends Area2D


const cell_distance = 8
var state = "up"


func _process(delta):
	control()


func control():
	if Input.is_action_just_pressed("Up"):
		state = "up"
	elif Input.is_action_just_pressed("Down"):
		state = "down"
	elif Input.is_action_just_pressed("Left"):
		state = "left"
	elif Input.is_action_just_pressed("Right"):
		state = "right"
	else:
		pass

func up():
	self.transform.origin.y -= cell_distance
	$"Sprite".rotation_degrees = 0
	$"Sprite".flip_v = false

func down():
	self.transform.origin.y += cell_distance
	$"Sprite".rotation_degrees = 0
	$"Sprite".flip_v = true

func left():
	self.transform.origin.x -= cell_distance
	$"Sprite".rotation_degrees = -90
	$"Sprite".flip_v = false

func right():
	self.transform.origin.x += cell_distance
	$"Sprite".rotation_degrees = 90
	$"Sprite".flip_v = false



func _on_Timer_timeout():
	if state == "up":
		up()
	elif state == "down":
		down()
	elif state == "left":
		left()
	elif state == "right":
		right()

func _on_death_group_area_entered(area):
	if area.is_in_group("death"):
		get_tree().reload_current_scene()
