extends Area2D

var speed
var damage
var origin = null
var target = null

var velocity = Vector2.ZERO
var acceleration = Vector2.ZERO
export var steer_force = 50.0

func _on_ProjectileMagic_body_entered(body):
	pass # Replace with function body.

func start(originid, targetid):
	print("start projectile")
	damage=originid.damage
	origin=originid
	target=targetid
	
	var data = Transform2D(0,originid.position)
	global_transform = data
	print(data)
	print(speed)
	velocity=data.x*speed

func _physics_process(delta):
	acceleration += seek()
	velocity += acceleration*delta
	velocity = velocity.clamped(speed)
	rotation = velocity.angle()
	position += velocity*delta
	
func _on_Missile_body_entered(body):
	print("colide")
	set_physics_process(false)
	target.receveDamage(damage)
	print(target.life)
	queue_free()

func seek():
	var steer = Vector2.ZERO
	if target:
		var desired = (target.position - position).normalized() * speed
		steer = (desired - velocity).normalized() * steer_force
	return steer
