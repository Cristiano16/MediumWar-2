extends KinematicBody2D

# Declare member variables here:
var tile_size = 32
export var speed = 1
onready var tween = $Tween

func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func run():
	$AnimationPlayer.play("Move")

	
func stop():
	$AnimationPlayer.stop()
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_right"):
		move_tween(Vector2(1,0))

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Tween_tween_started(object, key):
	run()

func _on_Tween_tween_completed(object, key):
	stop()
