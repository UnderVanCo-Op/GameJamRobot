extends Control

var ContGame : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_StartNewGameB_pressed():
	$Fade/AnimationPlayer.play("Fade between Scenes")
	#print("but worked")


func _on_AnimationPlayer_animation_finished(anim_name):
	pass
	#print("change scene worked")	
	get_tree().change_scene("res://Levels/Level1.tscn")
	#Global.goto_scene("res://Scenes/Levels/Level1/Root.tscn")


func _on_ContinueB_pressed():
	$Fade/AnimationPlayer.play("Fade between Scenes")
	ContGame = true


func _on_OptionsB_pressed():
	pass # Replace with function body.
