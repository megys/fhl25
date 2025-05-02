extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -250

signal died

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $Timer
@onready var death_timer: Timer = $"Death Timer"

var active = true
var is_alive = true

func _physics_process(delta: float) -> void:
	if active and is_alive:
		# Add the gravity.
		if not is_on_floor():
			velocity += 0.2*get_gravity() * delta

	# Handle pick up
		if Input.is_action_just_pressed("pick_up"):
			pickup_animation()

		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction: -1, 0, 1
		var direction := Input.get_axis("move_left", "move_right")
		
		# Flip the sprite
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
		
		# Apply movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()

func pickup_animation():
	active = false
	animated_sprite.play("pick up")
	timer.start()
	
func _on_timer_timeout() -> void:
	if is_alive:
		active = true
		animated_sprite.play("default")
	
func death_animation():
	is_alive = false
	animated_sprite.play("death")
	death_timer.start()
	
func _on_death_timer_timeout() -> void:
	died.emit()
	queue_free()
