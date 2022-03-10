extends Node

var slide_volume_master = 0.0
var max_point = 0
var coins = 0
var pegou_maca = false
var nome_da_fruta = "nenhum"
var score_file = "user://score.save"
var coins_file = "user://coins.save"
var max_points_agr = 0

func save_score():
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_var(Global.max_point)
	file.store_var(nome_da_fruta)
	file.store_var(max_points_agr)
	file.close()
func load_score():
	var file = File.new()
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		Global.max_point = file.get_var()
		nome_da_fruta = file.get_var()
		max_points_agr = file.get_var()
		file.close()
	else:
		Global.max_point = 0

func save_points():
	var file = File.new()
	file.open(coins_file, File.WRITE)
	file.store_var(coins)
	file.store_var(nome_da_fruta)
	file.close()
func load_points():
	var file = File.new()
	if file.file_exists(coins_file):
		file.open(coins_file, File.READ)
		coins = file.get_var()
		nome_da_fruta = file.get_var()
		file.close()
	else:
		Global.coins = 0

func _ready():
	load_score()
	load_points()

func _exit_tree():
	save_score()
	save_points()
