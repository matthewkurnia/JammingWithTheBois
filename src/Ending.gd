extends Control

export var main_menu: PackedScene

func _input(event):
	if event is InputEventKey and event.pressed:
		get_tree().quit()
