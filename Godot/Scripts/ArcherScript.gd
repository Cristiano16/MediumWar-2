extends "res://Scripts//RangedScript.gd"

onready var arrow = preload("res://Scenes/ProjectileArrow.tscn")
export var mySpeed = 1

func defineCharacteristics():
	speed=mySpeed
	life=150
	damage=10
	endurance=5
	reach=6
	attackSpeed=2
	purchaseValue=3
	saleValue=1
	giftValue=2

func _ready():
	defineCharacteristics()
	#moveOrAttack()
	
func attack(id):
	$AnimationPlayer.play("Attack")
	var myarrow = arrow.instance()
	get_tree().get_root().call_deferred("add_child", myarrow)
	myarrow.start(self, id)
	
