extends CharacterBody3D

@export_category("settings")
@export var SPEED = 5.0
@export var JUMP_VELOCITY = 5.0

@onready var anim = $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump2") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left2", "right2")
	if direction:
		anim.play("walk")
		velocity.x = direction * SPEED
	else:
		anim.play("RESET")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
