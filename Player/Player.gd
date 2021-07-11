extends KinematicBody2D

const step : int = 20		# размер шага
#var itemsCount : int = 0	# Кол-во вещей в инвентаре
var speed = Vector2()			# скорость (velocity)
#var inventory = {}		# Лист вещей в инвентаре
const jumpF = 500
const gravity = 10
const Rocket = preload("res://Player/Rocket.tscn")
var direction = 1
var isInJump = false

func _physics_process(_delta):
	if is_on_floor() and isInJump:
		if direction == 1:
			$AnimatedSprite.play("Wakeup_right")
		else:
			$AnimatedSprite.play("Wakeup_left")
		isInJump=false
	if !(is_on_floor()):
		if direction == 1:
			$AnimatedSprite.play("Right_jump")
		else:
			$AnimatedSprite.play("Left_jump")
	if Input.is_action_pressed("Player_goleft"):
		speed.x -= step
		direction = -1
		$AnimatedSprite.play("Left_run")
		if sign($RocketSpawnP.position.x) == -1:
			$RocketSpawnP.position.x *= -1
	
	elif Input.is_action_pressed("Player_goright"):
		speed.x += step
		direction = 1
		$AnimatedSprite.play("Right_run")
		if sign($RocketSpawnP.position.x) == -1:
			$RocketSpawnP.position.x *= -1
	
	if Input.is_action_pressed("Player_jump") and is_on_floor():
		speed.y -= jumpF
		isInJump = true
	
	if Input.is_action_just_pressed("Player_launch"):
		var rocket = Rocket.instance()
		
		if sign($RocketSpawnP.position.x) == 1:
			rocket.set_rocket_dir(direction)
		else:
			rocket.set_rocket_dir(direction)
		
		rocket.position = $RocketSpawnP.global_position
		get_parent().add_child(rocket)
	
#	elif Input.is_action_pressed("Player_down"):
#		speed.y += step
	speed.y += gravity
#	speed.y *= 0.9	# снижение скорости
#	speed.x *= 0.9	# снижение скорости
	#if(speed.length() > step):	# возможный фикс диагональной проблемы
		#speed.normalized()
	speed = move_and_slide(speed, Vector2.UP)	# Плавно перемещаться

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
