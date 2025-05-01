extends Area2D

@onready var timer: Timer = $Timer

var is_alive = true

func _on_body_entered(body: Node2D) -> void:
	if is_alive:
		print("you died")
		body.death_animation()
		#Engine.time_scale = 0.5
		timer.start()

func _on_timer_timeout() -> void:
	#Engine.time_scale = 1
	get_tree().reload_current_scene()
