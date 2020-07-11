extends AudioStreamPlayer

const MAX_LP = 300.0
const MIN_LP = 10000.0

var low_pass_bus = AudioServer.get_bus_index("LowPass")
onready var tween = $Tween
onready var lp_effect = AudioServer.get_bus_effect(low_pass_bus, 0)

func set_low_pass(apply_lp: bool, fade_duration: float):
	if apply_lp:
		tween.interpolate_property(lp_effect, "cutoff_hz", lp_effect.cutoff_hz,
				MAX_LP, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	else:
		tween.interpolate_property(lp_effect, "cutoff_hz", lp_effect.cutoff_hz,
				MIN_LP, fade_duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
