extends "res://Scripts/Projectile.gd"

export var myspeed = 20

func _init():
	print("Criando Magica")
	speed=myspeed

func _on_ProjectileMagic_body_entered(body):
	pass # Replace with function body.
