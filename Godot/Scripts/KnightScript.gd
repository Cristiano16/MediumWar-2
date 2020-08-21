extends "res://Scripts/MeleeScript.gd"

export var mySpeed = 0.5

func getSpeed():
	speed = mySpeed

func _ready():
	getSpeed()
