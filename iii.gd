extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var gun = $gun


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var have_gun

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("shoot"):
		if have_gun:
			pass
			gun.visible = true
			animated_sprite_2d.play("robot shooting")
	else :
		gun.visible = false

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	# Handle the animation direction
	if direction > 0:
		animated_sprite_2d.flip_h = false
		
		
	elif direction < 0   :
		animated_sprite_2d.flip_h = true
		
	
	# Handel the animations
	if is_on_floor():
		if direction != 0:
			animated_sprite_2d.play("run")
			
		else :
			animated_sprite_2d.play("robot shooting")
			
	else  :
		animated_sprite_2d.play("jump")
	
	
	if direction:
		velocity.x = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _process(delta):
	pass


func _on_h_it_box_body_entered(body):
	pass # Replace with function body.
	if body.is_in_group("Traps"):
		pass
		print('dead')




func _on_paraller_door_body_exited(body):
	pass # Replace with function body.
