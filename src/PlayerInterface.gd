extends CanvasLayer

onready var left = $Control/CenterContainer/HBoxContainer/Left
onready var right = $Control/CenterContainer/HBoxContainer/Right
onready var up = $Control/CenterContainer/HBoxContainer/Up
onready var down = $Control/CenterContainer/HBoxContainer/Down

func use_move(dir):
	pass

func update_move(index, value):
	match index:
		0: 
			right.update_label(value)
		1:
			left.update_label(value)
		2:
			down.update_label(value)
		3:
			up.update_label(value)
