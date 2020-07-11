tool
extends Area2D

export var next_level: PackedScene

func _get_configuration_warning():
	if not next_level:
		return "Exit cannot work without next level. Please insert next level."
	return ""

func _on_exit_body_entered(body):
	if body.name == "Player":
		body.set_physics_process(false)
		yield(get_tree().create_timer(0.5), "timeout")
		Global.change_scene(next_level)
