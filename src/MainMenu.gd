extends Control

export var level_1: PackedScene

func _input(event):
	if event is InputEventKey and event.pressed:
		Global.change_scene(level_1)
