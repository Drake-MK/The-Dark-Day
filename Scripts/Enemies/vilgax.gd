extends Area2D

@onready var sprite_2d = $Sprite2D
@onready var anim = $AnimationPlayer
@onready var limiter = $limiter

# fang attack area 
@onready var collision_polygon_2dR = $"fang attack area right/CollisionPolygon2D"
@onready var collision_polygon_2dL = $"fang attack area left/CollisionPolygon2D"

# move between two spaces




var speed = 100
var enemyPosition = null
var move = false
var attack = false
var inside_attack_zone = false



		
func _ready():
	anim.play("vilgax animation/Idle")

func _process(delta):
	
	
	
	# move towards player
	if move and not inside_attack_zone:
		anim.play("vilgax animation/run")
		var direction = (enemyPosition - global_position).normalized()
		
		if direction.x > 0:
			limiter.position.x = 30
			collision_polygon_2dR.disabled =  false
			collision_polygon_2dL.disabled =true
			sprite_2d.flip_h = false
		elif direction.x < 0:
			limiter.position.x = -16
			collision_polygon_2dR.disabled = true
			collision_polygon_2dL.disabled = false
			sprite_2d.flip_h = true
		if limiter.is_colliding():
			pass
			global_position.x += direction.x * speed * delta
		
		
		#attack	
	elif attack and inside_attack_zone:
		
		anim.play("vilgax animation/attack")
	else :
		anim.play("vilgax animation/Idle")
		
	
	
		# Allow movement when inside visible range
		# and out of attack range
func _on_visible_zone_body_entered(body):
	if body.name == 'Tertius' and not inside_attack_zone:
		move = true
		enemyPosition = body.global_position
		


# Deny movement when inside visible range
		# and out of attack range
func _on_visible_zone_body_exited(body):
	if body.name == 'Tertius':
		move = false


# Deny movement when inside attack range		
func _on_detch_player_and_attack_2_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius' :
		inside_attack_zone = true
		attack = true

# Allow movement when inside attack range	
func _on_detch_player_and_attack_2_body_exited(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		inside_attack_zone = false
		attack = false

# Player hit
func _on_fang_attack_area_right_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
		print('dead')
		# dead is too early


func _on_fang_attack_area_right_body_exited(body):
	pass # Replace with function body.


func _on_fang_attack_area_left_body_entered(body):
	pass # Replace with function body.
	if body.name == 'Tertius':
			print('dead')

func _on_fang_attack_area_left_body_exited(body):
	pass # Replace with function body.
	

func ban_move(v:bool = true):
	move = v
	

