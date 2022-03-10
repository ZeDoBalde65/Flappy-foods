extends StaticBody2D

func _physics_process(delta):
	position += Vector2(-100 * delta,0)


func _on_die_area_entered(area):
	if area.name == "destroy":
		queue_free()
