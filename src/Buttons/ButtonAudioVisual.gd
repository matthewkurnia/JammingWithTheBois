extends Node2D

onready var button_audio = $ButtonAudio
onready var pressed = $Pressed
onready var released = $Released

func _ready():
	owner.connect("update_state", self, "update_pressed")

func update_pressed(value: bool):
	if value:
		$ButtonAudio.play()
		pressed.visible = true
		return
	pressed.visible = false
