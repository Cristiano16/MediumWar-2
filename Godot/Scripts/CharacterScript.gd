extends KinematicBody2D

var tile_size = 32
export var speed = -1
var value

func run():
	$AnimationPlayer.play("Move")
	
func stop():
	$AnimationPlayer.stop()

func _ready():
	pass
