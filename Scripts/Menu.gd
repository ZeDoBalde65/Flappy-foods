extends Node2D

var master_sound = AudioServer.get_bus_index("Master")
var ta_com_som = false
var icon_con_som = preload("res://Sprites/IconPackAndelRodis/IconPackByAndelRodis/pngonebyone/musicon.png")
var icon_sem_som = preload("res://Sprites/IconPackAndelRodis/IconPackByAndelRodis/pngonebyone/musicoff.png")
func _on_Play_pressed():
	get_tree().change_scene("res://Levels/Game.tscn")
	

func _ready():
	get_tree().paused = false


func _on_Button_button_down():
	get_tree().quit()





func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Shop.tscn")


func _on_Button2_pressed():
	if(ta_com_som == false):
		AudioServer.set_bus_mute(master_sound, false)
		ta_com_som = true
		$CanvasLayer/Button2.icon = icon_con_som
	elif(ta_com_som):
		AudioServer.set_bus_mute(master_sound, true)
		ta_com_som = false
		$CanvasLayer/Button2.icon = icon_sem_som
