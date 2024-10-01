extends CharacterBody2D
@onready var l_anim = $"6/last animaytion"

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var gun = $gun
@onready var beam = $beam
@onready var beam_timer = $"beam timer"
@onready var beam_anim = $"beam anim"
@onready var beam_collision = $"beam/beam area/CollisionPolygon2D"
@onready var hitpoints = $Hitpoints

@onready var mc_1 = $mc1
@onready var tai_1 = $tai1

# Dead Anim
@onready var timer = $Timer


signal scored
var dead = false
var life = 4
@onready var death = $death






const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var have_laser  = false
var stop = false    # will stop the playes untill he presses enter 
# to solve the bug of the dailogue 
var pot
   # is the address for the sprites you want to display
var d = 1
var gamepause = false
func _ready():
	d = 1
	gamepause = false
	stop = false
	gun.visible = false
	have_laser = false
	beam.visible = false
	beam_collision.disabled = true
	
	life = 4
	
func final_death():
	
	d = 2
	animated_sprite_2d.play("death")
	print("played")
	
		
	
func _physics_process(delta):
	if d  == 2:
			timer.start(4)
			print("timer started")
			d = 3
			
	elif d == 1  :
			# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			gun.position.y= -23
			# Handle jump.
		if stop == true:
			animated_sprite_2d.play("idle")
				
			if Input.is_action_just_pressed("enter") or Input.is_action_just_pressed("shoot") :
				stop = false
		else:
			if Input.is_action_just_pressed("jump") and is_on_floor():
				velocity.y = JUMP_VELOCITY
				# Get the input direction and handle the movement/deceleration.
				# As good practice, you should replace UI actions with custom gameplay actions.
			var direction = Input.get_axis("move_left", "move_right")
				# Handel shooting
			if Input.is_action_just_pressed("shoot") and have_laser:
				beam.visible = true
				print("hi")
				beam_anim.play("laser")
				# Handle the animation direction
			if direction > 0:
				animated_sprite_2d.flip_h = false
				beam.position.x = 207
				beam.rotation = deg_to_rad(0)
				gun.flip_h = false
				gun.position.x = 8
					
			elif direction < 0   :
					
				animated_sprite_2d.flip_h = true
				gun.flip_h = true
				gun.position.x = -9
				beam.position.x = -207
				beam.rotation = deg_to_rad(180)
				# Handel the animations
			if is_on_floor():
				gun.position.y -24
				if direction != 0:
					if have_laser:
						animated_sprite_2d.play("run with gun")
					else:
						animated_sprite_2d.play("run")
						
				else :
					animated_sprite_2d.play("idle")
						
			else  :
				animated_sprite_2d.play("jump")
				
				
			if direction:
				velocity.x = direction * SPEED
					
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				
				
			move_and_slide()	


func _process(delta):
	pass
	if have_laser == true:
		gun.visible = true
	
func deathed():           # reduce the health
	hitpoints.hurt()      # hurt fxn from hitpoint script
	

func _on_beam_timer_timeout():
	pass # Replace with function body.
	beam.visible = false
	beam_collision.disabled = true


func _on_grosshoper_hurted():
	pass # Replace with function body.
	hitpoints.hurt()




func _on_body_area_entered(body):
	if body.is_in_group("trap") or body.is_in_group("enemy"):            # traps are the groups of traps :
		hitpoints.hurt()
		gamepause = true




func _on_timer_timeout():
	pass # Replace with function body.
	get_tree().reload_current_scene()


func _on_beam_area_score():
	pass # Replace with function body.
	emit_signal("scored")
func fakedeath():
	animated_sprite_2d.play("death")
