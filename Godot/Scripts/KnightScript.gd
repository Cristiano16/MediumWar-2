extends "res://Scripts/MeleeScript.gd"

export var mySpeed = 0.5

func defineCharacteristics():
	speed=mySpeed
	life=250
	damage=12
	endurance=20
	reach=1

func _ready():
	defineCharacteristics()
