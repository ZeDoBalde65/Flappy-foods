extends KinematicBody2D

const gravity = 30
const max_speed = 200
var jump = 700
var motion = Vector2()
var points = 0
export(bool) var enable = true
var morreu = false

func _physics_process(delta):
	motion.y += gravity
	if Input.is_action_just_pressed("Tap"):
		motion.y = -jump
	motion = move_and_slide(motion)
func _process(delta):
	if points > Global.max_point:
		Global.max_point = points
	get_parent().get_node("CanvasLayer/Label").text = str(points)
	get_parent().get_node("CanvasLayer/GameOver/Max_Poits").text = str(Global.max_point)

func _ready():
	get_parent().get_node("CanvasLayer/Label").get_font("font").outline_color = Color.black
	morreu = false
	Global.max_points_agr = Global.max_point
	if(Global.nome_da_fruta == "maca"):
		$PlayerSprite/AnimationPlayer.play("Maca")
	if(Global.nome_da_fruta == "banana"):
		$PlayerSprite/AnimationPlayer.play("Rotate")
	if(Global.nome_da_fruta == "hamburgue"):
		$PlayerSprite/AnimationPlayer.play("Hamburgue")
	if(Global.nome_da_fruta == "pancake"):
		$PlayerSprite/AnimationPlayer.play("Pancake")
	if(Global.nome_da_fruta == "bagel"):
		$PlayerSprite/AnimationPlayer.play("Bagel")
func _on_Detect_area_entered(area):
	if area.name == "Floor" or area.name == "die":
		$PlayerSprite.modulate = Color.white
		get_tree().paused = true
		morreu = true
		get_parent().get_node("CanvasLayer/GameOver/Label2").text = str(points)
		get_parent().get_node("CanvasLayer/Label").visible = false
		get_parent().get_node("CanvasLayer/GameOver").visible = true
		get_parent().get_node("CanvasLayer/GameOver/Tap_Reset").disabled = false
	if(Global.max_points_agr < Global.max_point and morreu == true):
		get_parent().get_node("CanvasLayer/NovoRecord").visible = true
		get_parent().get_node("CanvasLayer/NovoRecord/Recorde_anim").play("Record")
		get_parent().get_node("CanvasLayer/GameOver/Label2").get_font("font").outline_size = 6
		get_parent().get_node("CanvasLayer/GameOver/Label2").get_font("font").outline_color = Color.purple
	else:
		get_parent().get_node("CanvasLayer/GameOver/Label2").get_font("font").outline_size = 0
		get_parent().get_node("CanvasLayer/GameOver/Label2").get_font("font").outline_color = Color.white
	if area.name == "baf":
		points += 1
		if Global.coins >= 0:
			Global.coins += 1
