extends "res://Scripts/CharacterScript.gd"

onready var tween = $Tween


func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func _ready():
	pass

func _on_Tween_tween_started(object, key):
	run()

func _on_Tween_tween_completed(object, key):
	stop()

func moveForAttack(dir):
	move_tween(dir)
	get_tree().get_root().get_node("Game").get_node("Tabuleiro").move(self,dir)	

func receiveDamage(damage):
	life=life-(damage-(damage*(endurance/100)))
	if life<0:
		get_tree().get_root().get_node("Game").get_node("Tabuleiro").die(self)
