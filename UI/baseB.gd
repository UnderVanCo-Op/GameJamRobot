extends Control

export (int) var lvl_num
export (String) var lvl_to_load
export (bool) var is_enabled

func _ready():
	setup()

func setup():
	$But.text = str(lvl_num)


func _on_But_pressed():
	if(is_enabled):
		Main.goto_scene(lvl_to_load)
