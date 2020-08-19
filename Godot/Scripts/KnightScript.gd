extends "res://Scripts//OrcScript.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var myspeed = 0.2

func getSpeed():
	speed = myspeed

# Called when the node enters the scene tree for the first time.
func _ready():
	getSpeed()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
