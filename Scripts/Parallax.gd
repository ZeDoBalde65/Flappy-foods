extends ParallaxLayer

export(float) var move_speed = -40

func _process(delta):
	self.motion_offset.x += move_speed * delta
