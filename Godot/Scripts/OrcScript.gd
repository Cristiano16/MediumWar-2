extends "res://Scripts/MeleeScript.gd"

export var mySpeed = 2

func getSpeed():
	speed = mySpeed

func _ready():
	getSpeed()
