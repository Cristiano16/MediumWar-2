extends "res://Scripts//ArcherScript.gd"

# Declare member variables here. Examples:
export var mySpeed = 0.8

# Called when the node enters the scene tree for the first time.
func getSpeed():
	speed = mySpeed

func _ready():
	getSpeed()
	pass


