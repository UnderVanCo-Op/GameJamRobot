extends Area2D

const SPEED = 200 # rocket speed
var vel = Vector2()
var direction = 1 # rocket direction
var collided : bool = false
const dmgRocket = preload("res://Player/CollidedRocket.tscn")

func set_rocket_dir(_direction):
	direction = _direction 
	if _direction == -1:
		$Sprite.flip_h = true

func _physics_process(delta):
	vel.x = SPEED * delta * direction
	translate(vel)
	#animation

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Rocket_body_entered(body):
	collided = true
	var dmgrocket = dmgRocket.instance()
	dmgrocket.set_dir(direction)
	dmgrocket.position = $Sprite.global_position
	print("must be spawned")
	#get_parent().get_parent().add_child(dmgrocket)
	get_parent().get_parent().get_child(1).add_child(dmgrocket) # спавним в level1
	queue_free()
