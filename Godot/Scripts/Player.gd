extends Node2D
var mao=[[null,null,null],[null,null,null],[null,null,null]]
var cursor_position=[0,0]
var cursor_last_position=[0,0]
var changed=false
var activated=false
export var id=0
func _ready():
	pass
	
func _process(delta):
	if Input.is_action_just_released("right%s"%id):
		changed=true
		cursor_last_position[0]=cursor_position[0]
		cursor_last_position[1]=cursor_position[1]
		if cursor_position[0]!=2:
			cursor_position[0]+=1
		else:
			cursor_position[0]=0
	elif Input.is_action_just_released("left%s"%id):
		changed=true
		cursor_last_position[0]=cursor_position[0]
		cursor_last_position[1]=cursor_position[1]
		if cursor_position[0]!=0:
			cursor_position[0]+=-1
		else:
			cursor_position[0]=2
	elif Input.is_action_just_released("up%s"%id):
		changed=true
		cursor_last_position[0]=cursor_position[0]
		cursor_last_position[1]=cursor_position[1]
		if cursor_position[1]!=0:
			cursor_position[1]+=-1
		else:
			cursor_position[1]=2
	elif Input.is_action_just_released("down%s"%id):
		changed=true
		cursor_last_position[0]=cursor_position[0]
		cursor_last_position[1]=cursor_position[1]
		if cursor_position[1]!=2:
			cursor_position[1]+=1
		else:
			cursor_position[1]=0
	
	else:
		changed=false
	if Input.is_action_just_released("action%s"%id):
		activated=true
		cursor_position=[0,0]
		$TileMap.set_cell(cursor_position[0],cursor_position[1],id)
		changed=false
	if changed and activated:
		$TileMap.set_cell(cursor_last_position[0],cursor_last_position[1],0)
		$TileMap.set_cell(cursor_position[0],cursor_position[1],id)
