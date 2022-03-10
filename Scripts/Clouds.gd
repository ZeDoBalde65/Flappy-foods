extends StaticBody2D


func _physics_process(delta):
	position += Vector2(-400 * delta,0)


func _ready():
	global_position.y = rand_range(-201.309, 10.691)
	global_position.x = rand_range(773.667, 773.667)

func _on_Area2D_area_entered(area):
	if area.name == "destroy":
		queue_free()
