extends Node

@onready var label: Label = $UI/Time
@onready var timer: Timer = $UI/Countdown

func _ready():
	timer.start()
	
func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left/60)
	var second = int(time_left) % 60
	return [minute, second]
	
func _process(delta):
	label.text = "%02d:%02d" % time_left_to_live()
	
func return_time():
	return "%02d:%02d" % time_left_to_live()
