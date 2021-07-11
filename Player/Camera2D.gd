extends Camera2D

const DEAD_ZONE = 160

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var targ = event.position - get_viewport().size * 0.5
		if(targ.length() < DEAD_ZONE):
			self.position = Vector2(0,0)
		else:
			self.position = targ.normalized() * (targ.length() - DEAD_ZONE) * 0.5
