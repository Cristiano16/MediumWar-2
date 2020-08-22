extends Node2D
var mao=[[null,null,null],[null,null,null],[null,null,null]]
export var id=0
func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_released("right%s"%id):
		pass
