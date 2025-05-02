extends Node

var score = 0
var time_out = false
var end = false

@onready var score_manager: Label = $"CanvasLayer/UI/Score Manager"
@onready var canvas_layer: CanvasLayer = $CanvasLayer
@onready var player: CharacterBody2D = $"../Player"

@onready var end_song: AudioStreamPlayer = $"CanvasLayer/End Screens/End Song"
@onready var time_die_screen: Node2D = $"CanvasLayer/End Screens/Time Die Screen"
@onready var light_die_screen: Node2D = $"CanvasLayer/End Screens/Light Die Screen"
@onready var win_screen: Node2D = $"CanvasLayer/End Screens/Win Screen"
@onready var win_timer: Timer = $"Win Timer"
@onready var time_left: Label = $"CanvasLayer/End Screens/Win Screen/Time Left"

@onready var transition: AnimationPlayer = $CanvasLayer/Transition

var master_bus = AudioServer.get_bus_index("Master")

func _ready():
	transition.play("fade_in")

func _process(float) -> void:
	# m to mute
	if Input.is_action_just_pressed("mute"):
		AudioServer.set_bus_mute(master_bus, not AudioServer.is_bus_mute(master_bus))

func add_point():
	score += 1
	
	# game win
	if score == 6:
		print (canvas_layer.return_time())
		time_left.text = canvas_layer.return_time() + " Seconds Remaining"
		win_timer.start()
	
	if score == 1:
		score_manager.text = "You collected " + str(score) + " potion."
	else:
		score_manager.text = "You collected " + str(score) + " potions."

# time out
func _on_countdown_timeout() -> void:
	time_out = true
	player.death_animation()
	

# game over
func _on_player_died() -> void:
	end_song.play()
	transition.play("fade_in")
	
	# if time out
	if time_out:
		time_die_screen.visible = true
	# else shot by light
	else:
		light_die_screen.visible = true

# win game
func _on_win_timer_timeout() -> void:
	transition.play("fade_in")
	end_song.play()
	win_screen.visible = true

func end_game():
	transition.play("fade_out")
	end = true

# reload game after fade out
func _on_transition_animation_finished(anim_name: StringName) -> void:
		if end:
			get_tree().reload_current_scene()
