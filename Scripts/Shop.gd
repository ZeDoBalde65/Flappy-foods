extends Node2D

var tem_maca = false
var tem_hamburgue = false
var tem_pancake = false
var tem_bagel = false
var labels_file = "user://labels.save"

func _ready():
	load_score()
func _process(delta):
	if(Global.nome_da_fruta == "banana"):
		$Outras/Bananada.position.y = 252.582-8
	else:
		$Outras/Bananada.position.y = 252.582
	if(Global.nome_da_fruta == "hamburgue"):
		$Outras/Hamburgue.position.y = 255.69-8
	else:
		$Outras/Hamburgue.position.y = 255.69
	if(Global.nome_da_fruta == "pancake"):
		$Outras/Pancakes.position.y = 232.444-8
	else:
		$Outras/Pancakes.position.y = 232.444
	if(Global.nome_da_fruta == "bagel"):
		$Outras/Bagel.position.y = 430.69-8
	else:
		$Outras/Bagel.position.y = 430.69
	if(Global.nome_da_fruta == "maca"):
		$Outras/Apple.position.y = 248.69-8
	else:
		$Outras/Apple.position.y = 248.69
	if(tem_bagel == true):
		$Node2D/Bagel_Label.text = ""
	if(tem_maca == true):
		$Node2D/Apple_Label.text = ""
	if(tem_hamburgue == true):
		$Node2D/Hamburgue.text = ""
	if(tem_pancake == true):
		$Node2D/Pancake.text = ""
	if(Input.is_action_pressed("ui_down")):
		print(tem_hamburgue)
	if(Input.is_action_just_pressed("ui_up")):
		Global.coins += 400
	$Coin_Label.text = String(Global.coins)

func save_score():
	var file = File.new()
	file.open(labels_file, File.WRITE)
	file.store_var(tem_bagel)
	file.store_var(tem_maca)
	file.store_var(tem_pancake)
	file.store_var(tem_hamburgue)
	file.close()
func load_score():
	var file = File.new()
	if file.file_exists(labels_file):
		file.open(labels_file, File.READ)
		tem_bagel = file.get_var()
		tem_maca = file.get_var()
		tem_pancake = file.get_var()
		tem_hamburgue = file.get_var()
		file.close()

func _on_Button_pressed():
	save_score()
	get_tree().change_scene("res://Levels/Menu.tscn")

func _on_Apple_Button_pressed():
	if Global.coins >= 20 && tem_maca == false:
		Global.coins -= 20
		tem_maca = true
	if(tem_maca):
		Global.nome_da_fruta = "maca"


func _on_Banana_pressed():
	Global.nome_da_fruta = "banana"


func _on_Uva_Button_pressed():
	if Global.coins >= 30 && tem_hamburgue == false:
		Global.coins -= 30
		tem_hamburgue = true
	if(tem_hamburgue == true):
		Global.nome_da_fruta = "hamburgue"


func _on_Pancake_Button_pressed():
	if Global.coins >= 40 && tem_pancake == false:
		tem_pancake = true
		Global.coins -= 40
	if(tem_pancake == true):
		Global.nome_da_fruta = "pancake"

func _on_Bagel_pressed():
	if Global.coins >= 50 && tem_bagel == false:
		Global.coins -= 50
		tem_bagel = true
	if(tem_bagel):
		Global.nome_da_fruta = "bagel"
