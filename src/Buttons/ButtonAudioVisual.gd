extends Sprite

onready var button_audio = $ButtonAudio
onready var pressed = $Pressed
onready var released = $Released

func update_pressed(value: bool):
	if value:
		$ButtonAudio.play()
		pressed.visible = true
		return
	pressed.visible = false
