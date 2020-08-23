extends KinematicBody2D

var speed
var damage
var origin
var target
var angle
var targetPosition
var currentPosition
var translation = Vector2(0.0,0.0)

func _ready():
	pass # Replace with function body.

#Verificar se isso funcionar, verificar a velocidade dado ao angulo
func move_tween():
	tween.interpolate_property(self, 'rotation', rotation, angle, 2, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(self, "position",
		position, position + translation,
		1.0/speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func track():
	if(target.getDie!=false):
		targetPosition=get_tree().get_root().get_node("Tabuleiro").tilemap.world_to_map(target.global_position)
		if(targetPosition[0]-currentPosition[0]<0 and targetPosition[1]-currentPosition[1]<0):
				translation[0]=-abs(((targetPosition[0]-currentPosition[0])/(targetPosition[1]-currentPosition[1])))
				translation[1]=-abs(((targetPosition[1]-currentPosition[1])/(targetPosition[0]-currentPosition[0])))
				
		elif (targetPosition[0]-currentPosition[0]<0 and targetPosition[1]-currentPosition[1]>0):
				translation[0]=-abs(((targetPosition[0]-currentPosition[0])/(targetPosition[1]-currentPosition[1])))
				translation[1]=abs(((targetPosition[1]-currentPosition[1])/(targetPosition[0]-currentPosition[0])))
				
		elif(targetPosition[0]-currentPosition[0]>0 and targetPosition[1]-currentPosition[1]<0):
				translation[0]=abs(((targetPosition[0]-currentPosition[0])/(targetPosition[1]-currentPosition[1])))
				translation[1]=-abs(((targetPosition[1]-currentPosition[1])/(targetPosition[0]-currentPosition[0])))
		
		elif(targetPosition[0]-currentPosition[0]>0 and targetPosition[0]-currentPosition[0]>0):
				translation[0]=abs(((targetPosition[0]-currentPosition[0])/(targetPosition[1]-currentPosition[1])))
				translation[1]=abs(((targetPosition[1]-currentPosition[1])/(targetPosition[0]-currentPosition[0])))

		elif(targetPosition[0]-currentPosition[0]==0):
				if(targetPosition[1]-currentPosition[1]>0):
					translation[1]=1
				else: 
					translation[1]=-1
				translation[0]=0;
				
		elif(targetPosition[1]-currentPosition[1]==0):
				if(targetPosition[0]-currentPosition[0]>0):
					translation[0]=speed
				else:
					translation[0]=-speed
				translation[1]=0;
		
		angle=atan2(translation[1], translation[0])
		var dist = sqrt(pow(translation[0],2)+pow(translation[1],2))
		translation[0]=translation[0]*(speed/dist)
		translation[1]=translation[1]*(speed/dist)
		
		move_tween()
		#Não sei se é necessario
		currentPosition[0]=currentPosition[0]+translation[0]
		currentPosition[1]=currentPosition[1]+translation[1]
		
		#Verifica se colidiu
		
