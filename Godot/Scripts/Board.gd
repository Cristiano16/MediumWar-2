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
			if(matrix[i][j]!=null and not matrix[i][j].is_in_group("player%s"%id)):
				if(enemy==null):
					enemy = matrix[i][j]
				else:
					if(distance(matrix[i][j],id)<distance(enemy,id)):
						enemy=matrix[i][j]
	if(distance(enemy,id)<=id.reach):
		return [null, enemy]
	else:
		var dir;
		var coordEnemy=tilemap.world_to_map(enemy.global_position)
		var coordOwn=tilemap.world_to_map(id.global_position)
		if(abs(coordEnemy[0]-coordOwn[0])>=abs(coordEnemy[1]-coordOwn[1])):
			if(coordEnemy[0]>coordOwn[0]):
				dir = Vector2(1,0);
			else:
				dir = Vector2(-1,0);
			return[dir, null]
		else:
			if(coordEnemy[1]>coordOwn[1]):
				dir = Vector2(0,1);
			else:
				dir = Vector2(0,-1);
			return[dir, null]
