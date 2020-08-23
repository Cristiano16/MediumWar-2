extends "res://Scripts//RangedScript.gd"

export var mySpeed = 1

func defineCharacteristics():
	speed=mySpeed
	life=150
	damage=10
	endurance=5
	reach=6
	purchaseValue=3
	saleValue=1
	giftValue=2

func _ready():
	defineCharacteristics()
