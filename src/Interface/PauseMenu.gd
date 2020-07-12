extends Control

var is_paused = false

onready var continue_button = $CenterContainer/VBoxContainer/Continue
onready var settings_button = $CenterContainer/VBoxContainer/Settings
onready var quit_button = $CenterContainer/VBoxContainer/Quit

func _ready():
	self.visible = false

func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		set_pause(not is_paused)

func set_pause(value: bool):
	is_paused = value
	Music.set_low_pass(is_paused, 0.2)
	self.visible = is_paused
	get_tree().paused = is_paused

func _on_Continue_pressed():
	set_pause(false)

func _on_Quit_pressed():
	get_tree().quit()
