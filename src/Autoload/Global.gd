extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func change_scene(new_scene: PackedScene):
	get_tree().get_current_scene().pause_mode = Node.PAUSE_MODE_STOP
	Transition.fade_in()
	Music.set_low_pass(true, 0.2)
	yield(Transition, "animation_finished")
	get_tree().change_scene_to(new_scene)
	Transition.fade_out()
	Music.set_low_pass(false, 0.2)
