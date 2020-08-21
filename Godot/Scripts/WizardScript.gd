extends "res://Scripts//RangedScript.gd"

export var mySpeed = 0.8

func getSpeed():
	speed = mySpeed

func _ready():
	getSpeed()
