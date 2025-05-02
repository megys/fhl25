extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var timer: Timer = $Timer

var play = false
var pause_input = false

var cueOne = true
var cueTwo = false
var cueThree = false
var cueFour = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_anything_pressed() and not pause_input:
		if cueOne:
			animation_player.play("one")
			pause_input = true
			timer.start()
		elif cueTwo:
			animation_player.play("two")
			pause_input = true
			timer.start()
		elif cueThree:
			animation_player.play("three")
			pause_input = true
			timer.start()
		elif cueFour:
			animation_player.play("four")
			pause_input = true
			timer.start()

			


func _on_timer_timeout() -> void:
	pause_input = false
	if cueOne:
		cueOne = false
		cueTwo = true
	elif cueTwo:
		cueTwo = false
		cueThree = true
	elif cueThree:
		cueThree = false
		cueFour = true
	elif cueFour:
		cueFour = false
	elif play:
		get_tree().change_scene_to_file("res://scenes/game.tscn")

# press button to start game
func _on_button_button_up() -> void:
	animation_player.play("fade_out")
	play = true
	pause_input = true
	timer.start()
	
