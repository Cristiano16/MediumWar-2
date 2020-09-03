extends Node2D
onready var possible=[[preload("res://Scenes/CharacterArcher.tscn"),3],[preload("res://Scenes/CharacterHarpy.tscn"),5],[preload("res://Scenes/CharacterKnight.tscn"),2],[preload("res://Scenes/CharacterOrc.tscn"),4],[preload("res://Scenes/CharacterWizard.tscn"),5]]
var disponible=[null,null,null]
var showing=[null,null,null]
func _ready():
	show()
var cursor1=0
var cursor2=2
var activated1=false
var activated2=false
var last_cursor1
var last_cursor2
var changed1=false
var changed2=false
func _process(delta):
	if Input.is_action_just_released("buy1"):
		cursor1=0
		last_cursor1=0
		activated1=true
		if cursor2!=0:
			$TileMap.set_cell(0,0,1)
		else :
			$TileMap.set_cell(0,0,3)
	if Input.is_action_just_released("buy2"):
		cursor2=2
		activated2=true
		if cursor1!=2:
			$TileMap.set_cell(2,0,2)
		else :
			$TileMap.set_cell(2,0,3)
	if Input.is_action_just_pressed("left1"):
		
		changed1=true
		last_cursor1=cursor1
		if cursor1!=0:
			cursor1+=-1
		else:
			cursor1=2
	elif Input.is_action_just_pressed("right1"):
		
		changed1=true
		last_cursor1=cursor1
		if cursor1!=2:
			cursor1+=1
		else:
			cursor1=0
	else :
		changed1=false
	if changed1 and activated1:
		
		if (cursor2==last_cursor1 and activated2):
			$TileMap.set_cell(last_cursor1,0,2)
		else:
			print(last_cursor1)
			$TileMap.set_cell(last_cursor1,0,0)
		if (cursor2==cursor1 and activated2):
			$TileMap.set_cell(cursor1,0,3)
		else:
			$TileMap.set_cell(cursor1,0,1)
	if Input.is_action_just_pressed("left2"):
		
		changed2=true
		last_cursor2=cursor2
		if cursor2!=0:
			cursor2+=-1
		else:
			cursor2=2
	elif Input.is_action_just_pressed("right2"):
		
		changed2=true
		last_cursor2=cursor2
		if cursor2!=2:
			cursor2+=1
		else:
			cursor2=0
	else :
		changed2=false
	if changed2 and activated2:
		
		if (cursor1==last_cursor2 and activated1):
			$TileMap.set_cell(last_cursor2,0,1)
		else:
			
			$TileMap.set_cell(last_cursor2,0,0)
		if (cursor1==cursor2 and activated1):
			$TileMap.set_cell(cursor2,0,3)
		else:
			$TileMap.set_cell(cursor2,0,2)
func buy(player_id,player):
	var index=-1
	if player_id==1:
		index=cursor1
		activated1=false
		if (cursor1==cursor2 and activated2):
			$TileMap.set_cell(cursor1,0,2)
		else:
			
			$TileMap.set_cell(cursor1,0,0)
	elif player_id==2:
		index=cursor2
		activated2=false
		if (cursor1==cursor2 and activated1):
			$TileMap.set_cell(cursor2,0,1)
		else:
			
			$TileMap.set_cell(cursor2,0,0)
	else :
		print("buy error")
		return
	var obj=disponible[index][0].instance()
	if obj !=null:
		player.pay(disponible[index][1])
	return obj

func show():
	
	for i in range(3):
		if showing[i]!=null:
			showing[i].queue_free()
		randomize()
		disponible[i]=possible[int(rand_range(0,5))]
		showing[i]=disponible[i][0].instance()
		get_parent().call_deferred("add_child",showing[i])
		showing[i].global_position=$TileMap.map_to_world(Vector2(i,0))+$TileMap.global_position+Vector2(40,45)
		showing[i].get_node("Sprite").scale.x=4
		showing[i].get_node("Sprite").scale.y=4
