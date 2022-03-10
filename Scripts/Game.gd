extends Node2D

var wall = preload("res://Scenes/Wall.tscn")
var clouds = preload("res://Scenes/Clouds.tscn")

func _ready():
	get_tree().paused = false
	MenuMusic.stop()

func _process(delta):
	$testezin.text = String(Global.coins)
	$CanvasLayer/GameOver/Max_Poits.text = String(Global.max_point)

func wall_reset():
	var wall_instance = wall.instance()
	wall_instance.position = Vector2(700, rand_range(412.719, 25.615 * 3))
	call_deferred("add_child", wall_instance)


func _on_Timer_timeout():
	wall_reset()

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_GO_BACK_REQUEST:
		get_tree().change_scene("res://Levels/Menu.tscn")
		MenuMusic.play()

func _on_Tap_Reset_pressed():
	get_tree().reload_current_scene()
	get_tree().paused = false

func spawn_clouds():
	var instance_clouds = clouds.instance()
	call_deferred("add_child", instance_clouds) 


func _on_Timer_Spawn_Clouds_timeout():
	spawn_clouds()

func _on_Button_pressed():
	get_tree().change_scene("res://Levels/Menu.tscn")
