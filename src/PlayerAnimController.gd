extends AnimationPlayer

onready var anim_state_machine = $AnimationTree.get("parameters/playback")

func _ready():
	anim_state_machine.call_deferred("start", "idle")

func play_anim(dir = Vector2.ZERO):
	match dir:
		Vector2.LEFT:
			anim_state_machine.travel("left")
		Vector2.RIGHT:
			anim_state_machine.travel("right")
		Vector2.UP:
			anim_state_machine.travel("up_down")
		Vector2.DOWN:
			anim_state_machine.travel("up_down")

func play_error():
	anim_state_machine.travel("error")
