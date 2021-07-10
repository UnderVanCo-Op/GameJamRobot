extends Control

func _input(event):
	if event.is_action_pressed("Pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state		# переключить всю физику дерева сцены
		visible = new_pause_state


func _on_MainMenu_pressed():
	get_tree().paused = false	# выключаем паузу физики принудительно
	Main.goto_scene("res://UI/Title Screen.tscn")


func _on_Continue_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state		# переключить всю физику дерева сцены
	visible = new_pause_state


func _on_Restart_pressed():
	#get_tree().paused = false	# выключаем паузу физики принудительно
	print("restart pressed")
