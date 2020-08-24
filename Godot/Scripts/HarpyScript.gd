extends "res://Scripts/AssassinScript.gd"

export var mySpeed = 1.5

func defineCharacteristics():
	speed=mySpeed
	life=100
	damage=10
	endurance=2
	reach=3

func _ready():
	defineCharacteristics()
	#moveOrAttack()
