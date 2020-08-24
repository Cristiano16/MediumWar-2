extends "res://Scripts/Projectile.gd"

export var myspeed = 20

func _ready():
	speed=myspeed

func _on_ProjectileArrow_body_entered(body):
	pass # Replace with function body.
