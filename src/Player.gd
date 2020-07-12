extends Character

export var availMoves = [10, 10, 10, 10]
onready var interface = $Interface
onready var animation_player = $Sprite/AnimationPlayer
onready var sound_error = $SoundError
onready var sound_move = $SoundMove
onready var sound_pick_up = $SoundPickUp

func _ready():
	self.connect("move", animation_player, "play_anim")
	update_interface()

func stop_move():
	tween.stop_all()
	set_physics_process(true)

func moveGrid(dir):
	var index = -1
	if dir.x == 1:
		if availMoves[0] == 0:
			play_error()
			return
		availMoves[0] -= 1
		index = 0
	elif dir.x == -1:
		if availMoves[1] == 0:
			play_error()
			return
		availMoves[1] -= 1
		index = 1
	elif dir.y == 1:
		if availMoves[2] == 0:
			play_error()
			return
		availMoves[2] -= 1
		index = 2
	elif dir.y == -1:
		if availMoves[3] == 0:
			play_error()
			return
		availMoves[3] -= 1
		index = 3
	
	sound_move.play()
	interface.update_move(index, availMoves[index])
	
	.moveGrid(dir)

func play_error():
	if not sound_error.playing:
		animation_player.play_error()
		sound_error.play()

func exit():
	animation_player.exit()

func update_interface():
	for i in len(availMoves):
		interface.update_move(i, availMoves[i])

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
		interface.update_move(index, availMoves[index])
