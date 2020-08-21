extends KinematicBody2D

var tile_size = 32
var speed
var life
var damage
var endurance
var reach

func run():
	$AnimationPlayer.play("Move")
	
func stop():
	$AnimationPlayer.stop()

func _ready():
	pass
