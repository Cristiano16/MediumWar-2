extends "res://Scripts//RangedScript.gd"

onready var magic = preload("res://Scenes/ProjectileMagic.tscn")
export var mySpeed = 0.8
	
func defineCharacteristics():
	speed=mySpeed
	life=170
	damage=50
	endurance=5
	reach=8
	attackSpeed=0.5
	purchaseValue=5
	saleValue=2
	giftValue=3

func _ready():
	defineCharacteristics()
	#moveOrAttack()

func attack(id):
	$AnimationPlayer.play("Attack")
	var mymagic = magic.instance()
	get_tree().get_root().call_deferred("add_child",mymagic)	
	mymagic.start(self, id)
