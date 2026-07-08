extends CharacterBody2D

signal player_won
const SPEED = 250.0
const FLIP_COOLDOWN = 0.18
var gravity_dir := 1
var flip_timer := 0.0
var respawn_x = -57.0
var respawn_y = 440.0
var has_won := false

func _physics_process(delta: float) -> void:
	if has_won:
		return
	# Cooldown
	if flip_timer > 0:
		flip_timer -= delta

	# Flip BEFORE applying gravity or moving
	if Input.is_action_just_pressed("jump") \
	and (is_on_floor() or is_on_ceiling()) \
	and flip_timer <= 0:

		velocity.y = 0
		gravity_dir *= -1
		flip_timer = FLIP_COOLDOWN

		
		position.y += gravity_dir * 2
		


	# Apply gravity after flip
	velocity.y += get_gravity().y * gravity_dir * delta
	# Auto‑run
	velocity.x = SPEED

	move_and_slide()
	
	if is_on_wall():
		die()
		
		
func jump():
	velocity.y = gravity_dir * -500 
	print("JUMP")
		
		
func die():
	if has_won:
		return
	gravity_dir = 1
	velocity.y = 0
	scale.y = 1
	global_position = Vector2(respawn_x, respawn_y)
	print("Player died")
	
func win():
	print("Player won")
	emit_signal("player_won")
	has_won = true
	
func teleport():
	print("playerteleporting")
	global_position = Vector2(777, 43)
