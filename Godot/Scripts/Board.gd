extends Node2D

onready var matrix=[[],[],[],[],[],[],[],[],[],[]]
onready var tilemap=$TileMap
func _ready():
	for i in matrix:
		for _j in range(10):
			i.append(null)

func getPeca(x,y):
	return matrix[x][y]

func die(id):
	var coord=tilemap.world_to_map(id.global_position)
	if coord[0]<10 and coord[0]>=0 and coord[1]<10 and coord[1]>=0:
		matrix[coord[0]][coord[1]]=null

func move(id,dir):
	var coord=tilemap.world_to_map(id.global_position)
	if coord[0]<10 and coord[0]>=0 and coord[1]<10 and coord[1]>=0 and matrix[coord[0]+dir[0]][coord[1]+dir[1]]==null:
		matrix[coord[0]+dir[0]][coord[1]+dir[1]]=matrix[coord[0]][coord[1]]
		matrix[coord[0]][coord[1]]=null

func distance(id1, id2):
	var coord1=tilemap.world_to_map(id1.global_position)
	var coord2=tilemap.world_to_map(id2.global_position)
	return sqrt(pow(coord2[0]-coord1[0],2)+pow(coord2[1]-coord1[1],2))

func action(id):
	var enemy = null
	for i in matrix:
		for j in range(10):
			if(i[j]!=null and not i[j].is_in_group("player%s"%id)):
				if(enemy==null):
					enemy = i[j]
				else:
					if(distance(i[j],id)<distance(enemy,id)):
						enemy=i[j]
	if(enemy!=null and distance(enemy,id)<=id.reach):
		return [null, enemy]
	else:
		#Seleciona uma posição aleatoria para o personagem se mover
		randomize()
		var dir = int(rand_range(0,4))
		if(dir==0):
			dir = Vector2(1,0);
		elif(dir==1):
			dir = Vector2(-1,0);
		elif(dir==2):
			dir = Vector2(0,1);
		elif(dir==3):
			dir = Vector2(0,-1);
		return[dir, null]
