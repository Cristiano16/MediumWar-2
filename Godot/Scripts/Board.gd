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
