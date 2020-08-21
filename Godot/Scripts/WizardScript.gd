extends "res://Scripts//RangedScript.gd"

export var mySpeed = 0.8
	
func defineCharacteristics():
	speed=mySpeed
	life=170
	damage=50
	endurance=5
	reach=8

func _ready():
	defineCharacteristics()
