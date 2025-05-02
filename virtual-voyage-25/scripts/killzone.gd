extends Area2D

@onready var timer: Timer = $"Death Timer"

var is_alive = true

func _on_body_entered(body: Node2D) -> void:
	if is_alive:
		print("you died")
		body.death_animation()
