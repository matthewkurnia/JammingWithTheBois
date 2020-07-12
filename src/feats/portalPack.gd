tool
extends Node2D

export var portal1Pos = Vector2(100,0) setget set_portal_1
export var portal2Pos = Vector2(-100, 0) setget set_portal_2

onready var enter_anim = $EnterAnim
onready var active_audio = $ActiveAudio
var alreadyTransported = false

func _ready():
	$Portal1.global_position = portal1Pos
	$Portal2.global_position = portal2Pos

func set_portal_1(value):
	portal1Pos = value
	$Portal1.global_position = portal1Pos

func set_portal_2(value):
	portal2Pos = value
	$Portal2.global_position = portal2Pos

func _on_Portal1_area_entered(area):
	if area.is_in_group("player") and !alreadyTransported:
		var relativePos = area.position - $Portal1.position
		var newPos = $Portal2.position + relativePos
		area.position = newPos
		alreadyTransported = true
		enter_anim.play("enter")
		active_audio.play()

func _on_Portal2_area_entered(area):
	if area.is_in_group("player") and !alreadyTransported:
		var relativePos = area.position - $Portal2.position
		var newPos = $Portal1.position + relativePos
		area.position = newPos
		alreadyTransported = true
		enter_anim.play("enter")
		active_audio.play()

func _on_Portal2_area_exited(area):
	if area.is_in_group("player"):
		alreadyTransported = false

func _on_Portal1_area_exited(area):
	if area.is_in_group("player"):
		alreadyTransported = false
