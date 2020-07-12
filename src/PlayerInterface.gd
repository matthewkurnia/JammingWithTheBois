extends CanvasLayer

onready var left = $Control/CenterContainer/HBoxContainer/Left
onready var right = $Control/CenterContainer/HBoxContainer/Right
onready var up = $Control/CenterContainer/HBoxContainer/UpDown/Up
onready var down = $Control/CenterContainer/HBoxContainer/UpDown/Down

func _ready():
	var label = up.get_node("Label")
	up.move_child(label, 0)

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
