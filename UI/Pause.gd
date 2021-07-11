extends Control

# PAUSE MENU

func _input(event):
	if event.is_action_pressed("Pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state		# переключить всю физику дерева сцены
		visible = new_pause_state


func _on_MainMenu_pressed():
	#get_tree().paused = false	# выключаем паузу физики принудительно
	$Fade/AnimationPlayer.play("Anim_FadebtwScenes")


func _on_Continue_pressed():
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state		# переключить всю физику дерева сцены
	visible = new_pause_state


func _on_Restart_pressed():
	get_tree().paused = false	# выключаем паузу физики принудительно
	Main.goto_scene("res://Levels/" + get_tree().get_current_scene().get_name() + ".tscn")


func _on_AnimationPlayer_animation_finished(anim_name):
	Main.goto_scene("res://UI/Title Screen.tscn")
	get_tree().paused = false	# иначе в главном меню пауза будет
	
#PAUSE MENU
