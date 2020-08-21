extends Node2D
onready var possible=[[preload("res://Scenes/CharacterArcher.tscn"),3],[preload("res://Scenes/CharacterHarpy.tscn"),5],[preload("res://Scenes/CharacterKnight.tscn"),2],[preload("res://Scenes/CharacterOrc.tscn"),4],[preload("res://Scenes/CharacterWizard.tscn"),5]]
var disponible=[null,null,null]
var showing=[null,null,null]
func _ready():
	show()

func buy(index,player):

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
		
	
	
