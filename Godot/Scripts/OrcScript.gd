extends "res://Scripts/MeleeScript.gd"

export var mySpeed = 2

func defineCharacteristics():
	speed=mySpeed
	life=200
	damage=15
	endurance=7.5
	reach=1

func _ready():
	defineCharacteristics()
