extends Character

export var availMoves = [10, 10, 10, 10]

func _physics_process(delta):
	$Label.text = String(availMoves[0]) + " " + String(availMoves[1]) + " " + String(availMoves[2]) + " " + String(availMoves[3])
	
func moveGrid(dir):
	if dir.x == 1:
		if availMoves[0] == 0:
			return
		availMoves[0] -= 1
	elif dir.x == -1:
		if availMoves[1] == 0:
			return
		availMoves[1] -= 1
	elif dir.y == 1:
		if availMoves[2] == 0:
			return
		availMoves[2] -= 1
	elif dir.y == -1:
		if availMoves[3] == 0:
			return
		availMoves[3] -= 1
	.moveGrid(dir)

func _on_Player_area_entered(area):
	if area.is_in_group("item"):
		var index = -1
		if area.is_in_group("addright"):
			index = 0
		elif area.is_in_group("addleft"):
			index = 1
		elif area.is_in_group("adddown"):
			index = 2
		elif area.is_in_group("addup"):
			index = 3
		availMoves[index] += area.value
		area.queue_free()
		
