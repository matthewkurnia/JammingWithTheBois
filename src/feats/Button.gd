extends Area2D
class_name Buttonn

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

func _on_Button_area_entered(area):
	if area.is_in_group("player") and active:
		print("OP")
		yield(area.tween, "tween_completed")
		switcheroo(area)
		active = false


func _on_Button_area_exited(area):
	if area.is_in_group("player"):
		active = true
