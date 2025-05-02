extends Node2D

@onready var game_manager: Node = %GameManager

func _on_win_button_button_up() -> void:
	print("win")
	game_manager.end_game()
