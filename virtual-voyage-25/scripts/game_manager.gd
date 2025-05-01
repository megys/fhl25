extends Node

var score = 0

@onready var score_manager: Label = $"../Player/Camera2D/Score Manager"
@onready var camera_2d: Camera2D = $"../Player/Camera2D"
@onready var player: CharacterBody2D = $"../Player"

var master_bus = AudioServer.get_bus_index("Master")

func _process(float) -> void:
	# m to mute
	if Input.is_action_just_pressed("mute"):
		AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))

func add_point():
	score += 1
	
	# game win
	if score == 2:
		print (camera_2d.return_time())
	
	if score == 1:
		score_manager.text = "You collected " + str(score) + " potion."
	else:
		score_manager.text = "You collected " + str(score) + " potions."

# game over bc of time
func _on_countdown_timeout() -> void:
	player.death_animation()
