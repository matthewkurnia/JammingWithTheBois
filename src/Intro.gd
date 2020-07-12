extends Control

export var level_1: PackedScene

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		end_intro()

func end_intro():
	Global.change_scene(level_1)
