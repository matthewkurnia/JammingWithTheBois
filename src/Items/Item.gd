extends Area2D


export var value = 100

func _ready():
	$Label.set_deferred("text", String(value))
