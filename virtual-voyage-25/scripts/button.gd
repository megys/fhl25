extends Node2D

@onready var game_manager: Node = %GameManager

func _on_button_button_up() -> void:
	print("time die")
	game_manager.end_game()
