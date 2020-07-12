extends VBoxContainer

onready var label = $Label
onready var anim_player = $AnimationPlayer

func update_label(value: int):
	label.text = String(value)
	anim_player.play("add")
