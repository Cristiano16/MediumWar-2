extends "res://Scripts/Projectile.gd"

export var myspeed = 12

func _init(origin, target):
	speed=myspeed
	start(origin, target)

func _on_ProjectileMagic_body_entered(body):
	pass # Replace with function body.
