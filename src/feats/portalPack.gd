extends Node2D

export var portal1Pos = Vector2(100,0)
export var portal2Pos = Vector2(-100, 0)

var alreadyTransported = false

func _ready():
	$Portal1.global_position = portal1Pos
	$Portal2.global_position = portal2Pos

func _on_Portal1_area_entered(area):
	if area.is_in_group("player") and !alreadyTransported:
		var relativePos = area.position - $Portal1.position
		var newPos = $Portal2.position + relativePos
		area.position = newPos
		alreadyTransported = true

func _on_Portal2_area_entered(area):
	if area.is_in_group("player") and !alreadyTransported:
		var relativePos = area.position - $Portal2.position
		var newPos = $Portal1.position + relativePos
		area.position = newPos
		alreadyTransported = true

func _on_Portal2_area_exited(area):
	if area.is_in_group("player"):
		alreadyTransported = false

func _on_Portal1_area_exited(area):
	if area.is_in_group("player"):
		alreadyTransported = false
