extends "res://Scripts/MeleeScript.gd"

export var mySpeed = 2

func defineCharacteristics():
	speed=mySpeed
	life=200
	damage=15
	endurance=7.5
	reach=1
	attackSpeed=1.8
	purchaseValue=4
	saleValue=2
	giftValue=3

func _ready():
	defineCharacteristics()
	#moveOrAttack()
