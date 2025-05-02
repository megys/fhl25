extends Node2D

@onready var game_manager: Node = %GameManager

func _on_light_button_button_up() -> void:
	print("light die")
	game_manager.end_game()
