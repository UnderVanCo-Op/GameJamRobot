extends Node2D

var dir = 1

func set_dir(_dir):
	dir = _dir

func _ready():
	if(dir != 1):
		$Sprite.flip_h = true
