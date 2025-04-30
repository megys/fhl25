extends ParallaxLayer


@export var FOG_SPEED:float = -7

func _process(delta) -> void:
	self.motion_offset.x += FOG_SPEED * delta
