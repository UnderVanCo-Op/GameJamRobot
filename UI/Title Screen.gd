extends Control

#TITLE SCREEN

func _ready():
#	$MenuC/CenterRowC/MarginC/ColorRect/ButtonsC/StartNewGameB.grab_focus()
	get_tree().paused = false # принудительно убираем паузу физики и UI на всякий


func _on_StartNewGameB_pressed():
	$Fade/AnimationPlayer.play("Anim_FadebtwScenes")


func _on_AnimationPlayer_animation_finished(anim_name):
	#print("change scene worked")	
	#get_tree().change_scene("res://Levels/Level1.tscn")
	#Global.goto_scene("res://Scenes/Levels/Level1/Root.tscn")
	Main.goto_scene("res://Levels/Level1.tscn")


func _on_OptionsB_pressed():
	pass # Replace with function body.


func _on_LevelsB_pressed():
	$Fade/AnimationPlayer.play("Anim_FadebtwScenes")
	Main.goto_scene("res://UI/LevelSelect.tscn")

#TITLE SCREEN
