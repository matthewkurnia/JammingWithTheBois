extends Control

signal animation_finished(anim_name)

export var asdf: PackedScene
onready var anim_player = $AnimationPlayer

func fade_in():
	anim_player.play("fade_in")

func fade_out():
	anim_player.play_backwards("fade_in")


func _on_animation_finished(anim_name):
	emit_signal("animation_finished", anim_name)
