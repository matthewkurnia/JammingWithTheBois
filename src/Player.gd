extends Character

export var availMoves = [10, 10, 10, 10]
onready var animation_player = $Sprite/AnimationPlayer
onready var sound_error = $SoundError
onready var sound_move = $SoundMove
onready var sound_pick_up = $SoundPickUp

func _ready():
	self.connect("move", animation_player, "play_anim")

func _physics_process(delta):
	$Label.text = String(availMoves[0]) + " " + String(availMoves[1]) + " " + String(availMoves[2]) + " " + String(availMoves[3])

func moveGrid(dir):
	if dir.x == 1:
		if availMoves[0] == 0:
			play_error()
			return
		availMoves[0] -= 1
	elif dir.x == -1:
		if availMoves[1] == 0:
			play_error()
			return
		availMoves[1] -= 1
	elif dir.y == 1:
		if availMoves[2] == 0:
			play_error()
			return
		availMoves[2] -= 1
	elif dir.y == -1:
		if availMoves[3] == 0:
			play_error()
			return
		availMoves[3] -= 1
	
	sound_move.play()
	.moveGrid(dir)

func play_error():
	if not sound_error.playing:
		animation_player.play_error()
		sound_error.play()

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
		sound_pick_up.play()
