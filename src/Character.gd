class_name Character

extends Area2D

signal move(dir)

onready var vision = $RayCast2D
onready var tween = $Tween
export var speed = 4.0
var can_handle_input = true

const tileSize := 100

func moveGrid(dir):
	tween.interpolate_property(self, "position",
		position, position + dir*tileSize,
		1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	emit_signal("move", dir)
	set_physics_process(false)
	tween.start()
	yield(tween, "tween_completed")
	set_physics_process(true)
	
func checkObstacle(dir):
	vision.cast_to = dir*tileSize
	vision.force_raycast_update()
	if !vision.is_colliding():
		moveGrid(dir)

func updatePos():
	var xMove = Input.get_action_strength("moveRight") - Input.get_action_strength("moveLeft")
	var yMove = Input.get_action_strength("moveDown") - Input.get_action_strength("moveUp")
	
	if bool(xMove):
		checkObstacle(Vector2(xMove, 0))
	elif bool(yMove):
		checkObstacle(Vector2(0, yMove))
		
func _physics_process(delta):
	if can_handle_input:
		updatePos()
