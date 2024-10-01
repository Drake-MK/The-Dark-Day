extends Area2D

@onready var anim = $AnimationPlayer
@onready var limiter_l_r = $"limiter L&R"
@onready var limiter_down = $"limiter down"
@onready var sprite_2d = $Sprite2D
@onready var collision_polygon_2dR = $"fang attack area right/CollisionPolygon2D"
@onready var collision_polygon_2dL = $"fang attack area left/CollisionPolygon2D"


signal hurted
var inside = false
var damage = false
var speed = 100
var enemy = null
var move = false
var attack = false
var inside_attack_zone = false

func _ready():
	anim.play("idle")


func _process(delta):
	if move and enemy and not inside_attack_zone:
		anim.play("run")
		var direction = (enemy.global_position - global_position).normalized()
		if direction.x > 0:
			limiter_l_r.rotation = deg_to_rad(-90)
			limiter_l_r.position.x = 6 # Rotate to 180 degrees
			limiter_down.position.x = 28
			collision_polygon_2dR.disabled = false
			collision_polygon_2dL.disabled = true
			sprite_2d.flip_h = false
		elif direction.x < 0:
			limiter_l_r.rotation = deg_to_rad(90)
			limiter_l_r.position.x = -6 # Rotate to 0 degrees
			limiter_down.position.x = -28
			collision_polygon_2dR.disabled = true
			collision_polygon_2dL.disabled = false
			sprite_2d.flip_h = true
		if not limiter_l_r.is_colliding() and limiter_down.is_colliding():
			global_position += direction * speed * delta
		else :
			anim.play("idle")
	elif attack and inside_attack_zone:
		anim.play("attack")
	else:
		anim.play("idle")

func _on_visible_zone_body_entered(body):
	if body.name == 'Tertius' and not inside_attack_zone:
		move = true
		enemy = body

func _on_visible_zone_body_exited(body):
	if body.name == 'Tertius':
		move = false
		enemy = null

func _on_detch_player_and_attack_2_body_entered(body):
	if body.name == 'Tertius':
		inside_attack_zone = true
		attack = true

func _on_detch_player_and_attack_2_body_exited(body):
	if body.name == 'Tertius':
		inside_attack_zone = false
		attack = false

func _on_fang_attack_area_right_body_entered(body):
	
	if body.name == 'Tertius' and inside_attack_zone:
		print('dead')
		hurted.emit()

func _on_fang_attack_area_left_body_entered(body):
	if body.name == 'Tertius':
		print('dead')
		hurted.emit()
	
func _on_fang_attack_area_right_area_entered(area):
	pass # Replace with function body.
	if area.is_in_group("player"):
		hurted.emit()


func _on_fang_attack_area_left_area_entered(area):
	pass # Replace with function body.
	if area.is_in_group('player'):
		hurted.emit()
