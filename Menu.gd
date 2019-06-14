#start menu.gd

extends Control




func _on_Button_pressed():
	get_tree().change_scene("res://world.tscn")


func _on_QuitBtn_pressed():
	get_tree().quit()
