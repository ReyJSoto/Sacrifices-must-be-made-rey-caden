extends CharacterBody2D


const SPEED = 670.0
const JUMP_VELOCITY = -410.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if not Input.is_anything_pressed() or Input.is_action_just_pressed("jump"):
		$Movement.frame = 0

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		$Movement.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

@export var main_tscn: PackedScene

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("throw"):
		throw_ball()

func throw_ball():
	var ball = main_tscn.instantiate()
	get_tree().current_scene.add_child(ball)
	ball.global_position = global_position

	var mouse_position = get_global_mouse_position()
	var direction = mouse_position - global_position
	ball.throw_in_direction(direction)
