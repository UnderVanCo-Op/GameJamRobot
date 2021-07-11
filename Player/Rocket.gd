extends Area2D

const SPEED = 200
var vel = Vector2()
var direction = 1

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