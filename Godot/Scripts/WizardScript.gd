extends "res://Scripts//RangedScript.gd"

export var mySpeed = 0.8
	
func defineCharacteristics():
	speed=mySpeed
	life=170
	damage=50
	endurance=5
	reach=8
	purchaseValue=5
	saleValue=2
	giftValue=3

func _ready():
	defineCharacteristics()
#	moveOrAttack()

func attack(id):
	$AnimationPlayer.play("Attack")
	get_tree().get_root().get_node("ProjectileMagic").start(self, id)

