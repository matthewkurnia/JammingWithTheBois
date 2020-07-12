extends Node2D

const MAX_LENGTH = 2000
const START_POINT = 75

enum NamedEnum {RIGHT, DOWN, LEFT, UP}
export(NamedEnum) var direction
export var buttonPos = Vector2(100, 0)

onready var ray = $RayCast2D
onready var hit = $hitPoint
onready var beam = $StaticBody2D

var sudut = 0.0
var active = false
var alreadyEntered = false

func _ready():
	if direction == NamedEnum.RIGHT:
		sudut = 0
	elif direction == NamedEnum.DOWN:
		sudut = PI/2
	elif direction == NamedEnum.LEFT:
		sudut = PI
	elif direction == NamedEnum.UP:
		sudut = -PI/2
	ray.position = Vector2(START_POINT, 0).rotated(sudut)
	$Sprite.rotate(sudut)
	$toggleArea.global_position = buttonPos
	
func _physics_process(delta):
	ray.cast_to = Vector2(MAX_LENGTH, 0).rotated(sudut)
	if ray.is_colliding():
		hit.global_position = (ray.get_collision_point())
	else:
		hit.global_position = (ray.cast_to)
	beam.get_node("beam").region_rect.end.x = hit.global_position.x
	var collShape = RectangleShape2D.new()
	collShape.extents = Vector2(hit.global_position.x/2, 50)
	$StaticBody2D.position = Vector2(hit.global_position.x/3, 0).rotated(sudut)
	$StaticBody2D/CollisionShape2D.shape = collShape
	$StaticBody2D/beam.position = Vector2(-hit.global_position.x/2, 0)
	print($StaticBody2D/CollisionShape2D.shape, hit.global_position)
	beam.rotation = sudut

func _on_toggleArea_area_entered(area):
	if area.is_in_group("player") and !alreadyEntered:
		active = !active
		alreadyEntered = true
		if active:
			ray.enabled = false
			beam.visible = false
			beam.set_process(false)
		else:
			ray.enabled = true
			beam.visible = true
			beam.set_process(true)
			

func _on_toggleArea_area_exited(area):
	if area.is_in_group("player"):
		alreadyEntered = false
