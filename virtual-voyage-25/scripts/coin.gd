extends Area2D

@onready var game_manager: Node = %GameManager
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var entered = false

func _process(float) -> void:
	if Input.is_action_just_pressed("pick_up") and entered:
		game_manager.add_point()
		animation_player.play("pick up")

func _on_body_entered(body: Node2D) -> void:
	entered = true
	print("bleh")

func _on_body_exited(body: Node2D) -> void:
	entered = false
