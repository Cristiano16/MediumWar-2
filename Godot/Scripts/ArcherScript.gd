extends "res://Scripts//RangedScript.gd"

export var mySpeed = 1

func defineCharacteristics():
	speed=mySpeed
	life=150
	damage=10
	endurance=5
	reach=6

func _ready():
	defineCharacteristics()
