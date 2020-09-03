extends "res://Scripts/Projectile.gd"

export var myspeed = 30

func _init():
	print("criando flecha")
	speed=myspeed

func _on_ProjectileArrow_body_entered(body):
	pass # Replace with function body.
