extends KinematicBody2D

#PLAYER

const step : int = 500		# размер шага
#var itemsCount : int = 0	# Кол-во вещей в инвентаре
var speed = Vector2()		# скорость (velocity)
#var inventory = {}		# Лист вещей в инвентаре
const jumpF = 500
const gravity = 10
const Rocket = preload("res://Player/Rocket.tscn")
var direction = 1
var wasJump = false
var movem_koef : float = 1
var isArmed : bool = true
var Health : int = 100

func _physics_process(_delta):
	
	if position.y > 500:
		queue_free()
		#DEATH SCREEN
	
	if is_on_floor() and wasJump:
		wasJump = false
		if direction == 1:
			$AnimatedSprite.play("Wakeup_right")
		else:
			$AnimatedSprite.play("Wakeup_left")
	
	if(is_on_floor()):
		movem_koef = 1
	else:
		movem_koef = 0.85
	
	if Input.is_action_pressed("Player_goleft"):
		speed.x = -step * movem_koef
		direction = -1
		$AnimatedSprite.play("Left_run")
		if sign($RocketSpawnP.position.x) == -1:
			$RocketSpawnP.position.x *= -1
	
	elif Input.is_action_pressed("Player_goright"):
		speed.x = step * movem_koef
		direction = 1
		$AnimatedSprite.play("Right_run")
		if sign($RocketSpawnP.position.x) == -1:
			$RocketSpawnP.position.x *= -1
	
	else:
		if(abs(speed.x) > 10):
			if sign(speed.x) == 1:
				speed.x -= 10
			else:
				speed.x += 10
		else:
			speed.x = 0
	
	if Input.is_action_pressed("Player_jump") and is_on_floor():
		speed.y -= jumpF
		if direction == 1:
			$AnimatedSprite.play("Right_jump")
		else:
			$AnimatedSprite.play("Left_jump")
		wasJump = true
	
	if Input.is_action_just_pressed("Player_launch") and isArmed:
		isArmed = false
		var rocket = Rocket.instance()
		if sign($RocketSpawnP.position.x) == 1:
			rocket.set_rocket_dir(direction)
		else:
			rocket.set_rocket_dir(direction)
		rocket.position = $RocketSpawnP.global_position
		get_parent().add_child(rocket)
	
	speed.y += gravity

	speed = move_and_slide(speed, Vector2.UP)	# Плавно перемещаться
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		print("I collided with ", collision.collider.name)
		#if(collision.collider.name == "d"):
		#	pass

func pick():
	isArmed = true

#PLAYER
