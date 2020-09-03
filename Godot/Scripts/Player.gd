extends Node2D
var mao=[[null,null,null],[null,null,null],[null,null,null]]
var cursor_position=[0,0]
var cursor_last_position=[0,0]
var cursor_location=null
var changed=false
var activated=false
var gold=5
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
	if Input.is_action_just_released("buy%s"%id):
		cursor_location="bank"
	if Input.is_action_just_released("action%s"%id):
		if cursor_location=="bank":
			var free=find_free_position()
			
			
			if free!=null:
				
				mao[free[0]][free[1]]=get_parent().get_node("Banco").buy(id,self)
				get_parent().add_child(mao[free[0]][free[1]])
				mao[free[0]][free[1]].global_position=$TileMap.map_to_world(Vector2(free[0],free[1]))+$TileMap.global_position+Vector2(40,45)
				mao[free[0]][free[1]].scale.x=2
				mao[free[0]][free[1]].scale.y=2
				activated=true
				cursor_position=[free[0],free[1]]
				$TileMap.set_cell(cursor_position[0],cursor_position[1],id)
				changed=false
			else:
				activated=true
				cursor_position=[0,0]
				$TileMap.set_cell(cursor_position[0],cursor_position[1],id)
				changed=false
		elif cursor_location==null:
			activated=true
			cursor_position=[0,0]
			$TileMap.set_cell(cursor_position[0],cursor_position[1],id)
			changed=false
	if changed and activated:
		$TileMap.set_cell(cursor_last_position[0],cursor_last_position[1],0)
		$TileMap.set_cell(cursor_position[0],cursor_position[1],id)
func pay(value):
	gold+=-value
	
func find_free_position():
	for i in range(3):
		for j in range(3):
			if mao[j][i]==null:
				return [j,i]
	return null
