extends Area2D

const SPEED = 200
var vel = Vector2()

func _physics_process(delta):
	vel.x = SPEED * delta
	translate(vel)
	#animation


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
