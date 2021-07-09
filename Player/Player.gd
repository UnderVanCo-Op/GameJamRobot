extends KinematicBody2D

var step : int = 20		# размер шага
var itemsCount : int = 0	# Кол-во вещей в инвентаре
var speed = Vector2()			# скорость (velocity)
var inventory = {}		# Лист вещей в инвентаре

	
func _physics_process(_delta):
	if Input.is_action_pressed("Player_goleft"):
		speed.x -= step
	elif Input.is_action_pressed("Player_goright"):
		speed.x += step
	if Input.is_action_pressed("Player_goup"):
		speed.y -= step
	elif Input.is_action_pressed("Player_godown"):
		speed.y += step
	speed.y *= 0.9	# снижение скорости
	speed.x *= 0.9	# снижение скорости	
	#if(speed.length() > step):	# возможный фикс диагональной проблемы
		#speed.normalized()
	speed = move_and_slide(speed, Vector2.UP)	# Плавно перемещаться

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
