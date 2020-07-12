extends Node

func restart():
	Transition.fade_in()
	get_tree().paused = true
	yield(Transition, "animation_finished")
	get_tree().reload_current_scene()
	Transition.fade_out()
	get_tree().paused = false

func change_scene(new_scene: PackedScene):
	var curr_scene = get_tree().get_current_scene()
	curr_scene.pause_mode = Node.PAUSE_MODE_STOP
	Transition.fade_in()
	Music.set_low_pass(true, 0.2)
	yield(Transition, "animation_finished")
	get_tree().change_scene_to(new_scene)
	Transition.fade_out()
	Music.set_low_pass(false, 0.2)
