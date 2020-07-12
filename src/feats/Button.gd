extends Area2D
class_name Buttonn

signal update_state(pressed)

var active = true

func switch(right, left, down, up, player):
	print("OPOPOP")
	
func switcheroo(player):
	var right = player.availMoves[0]
	var left = player.availMoves[1]
	var down = player.availMoves[2]
	var up = player.availMoves[3]
	print("OPOP")
	switch(right, left, down, up, player)
	player.update_interface()

func _on_Button_area_entered(area):
	if area.is_in_group("player") and active:
		print("OP")
		yield(area.tween, "tween_completed")
		switcheroo(area)
		active = false
		emit_signal("update_state", not active)


func _on_Button_area_exited(area):
	if area.is_in_group("player"):
		active = true
		emit_signal("update_state", not active)
