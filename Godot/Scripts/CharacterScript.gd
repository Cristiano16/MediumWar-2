extends KinematicBody2D

var tile_size = 32
var speed
var life
var damage
var endurance
var reach
var player

func run():
	$AnimationPlayer.play("Move")
	
func stop():
	$AnimationPlayer.stop()

func moveOrAttack():
	if (get_tree().get_root().get_node("Tabuleiro").action(self)[0]!=null):	#Função action no tabuleiro retorna um vetor com direção e id da peça inimiga. Estou supondo que ela recebe o id da peça que a chama
		moveForAttack(get_tree().get_root().get_node("Tabuleiro").action(self)[0])
	else:
		attack(get_tree().get_root().get_node("Tabuleiro").action(self)[1])
func _ready():
	pass
func moveForAttack(dir):
	pass
func attack(id):
	pass
